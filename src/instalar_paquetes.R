instalar_paquetes <- function() {
    pckg = c("tidyverse")
    
    is.installed <- function(mypkg) {
        is.element(mypkg, installed.packages()[, 1])
    }
    
    for (i in 1:length(pckg)) {
        if (!is.installed(pckg[i])) {
            install.packages(pckg[i])
        }
    }
    
    suppressPackageStartupMessages(require(tidyverse))
}
