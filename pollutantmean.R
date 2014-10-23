pollutantmean <- function(directory, pollutant, id = 1:332) {
   setwd(directory);
   files <- list.files();
   files <- files[id]
   Q <- vector();
   for (i in 1:length(files)){
      data <- read.table(files[i],sep=",",header=TRUE);
      x <- match(pollutant,names(data))
      Q <- append(data[,x],Q);
      }
   print(mean(Q,na.rm=TRUE));
}

