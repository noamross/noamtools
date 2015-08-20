require(foreach)
require(iterators)
require(parallel)
require(doParallel)
cl <- makeCluster(detectCores()-1)
registerDoParallel(cl)

bob <- matrix(1:9, 3)
iterc <- icount(3)
interm <- iapply(bob,1)
xit <- icountn(dim(bob)[1])
iterv <- icountn(3:5)
rf <- function() browser()
icountp <- function (count) 
{
    if (missing(count)) 
        count <- NULL
    else if (!is.numeric(count) || length(count) != 1) 
        stop("count must be a numeric value")
    i <- 0L
    pb <- txtProgressBar(max=count, style=3)
    nextEl <- function() {
        if (is.null(count) || i < count) {
            (i <<- i + 1L)
        } else stop("StopIteration", call. = FALSE)
    }
    it <- list(nextElem = nextEl)
    class(it) <- c("abstractiter", "iter")
    it
}

iterp <- icountp(100)
mcoptions <- list(mc.preschedule=FALSE)

y <- foreach(i=iterp, .combine=c, .multicombine=TRUE, .options.multicore=mcoptions) %dopar% {
  mean(rnorm(mean=i, 1000000))
}

iterp <- icountp(1000)
0
