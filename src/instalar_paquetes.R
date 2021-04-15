instalar_paquetes <- function() {
    pckg = c(
        "tidyverse", 
        "corrplot", 
        "ade4", 
        "cluster", 
        "FactoMineR", 
        "gplots", 
        "pvclust"
    )
    
    is.installed <- function(mypkg) {
        is.element(mypkg, installed.packages()[, 1])
    }
    
    for (i in 1:length(pckg)) {
        if (!is.installed(pckg[i])) {
            install.packages(pckg[i])
        }
    }
    
}
