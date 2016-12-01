myfunct <- function(y){
  
  seg_pos <- seg.sites(y)
  nt_subt <- vector("list", length(seg_pos))
  
  mod <- lapply(as.list(seg_pos), function(x) x %% 3)
  
  for (i in 1:length(mod)){
    if (mod[[i]] == 0){
      t <- seg_pos[i]- 2
      new <- y[, t:seg_pos[i]]
      nt_subt[[i]] <- new
    } 
    else if (mod[[i]] == 1){
      t <- seg_pos[i]+ 2
      new <- y[, seg_pos[i]:t]
      nt_subt[[i]] <- new
    }
    else {
      st <- seg_pos[i] - 1
      end <- seg_pos[i] + 1
      new <- y[, st:end]
      nt_subt[[i]] <- new
      
    }
    
  }  
  
  return(nt_subt)
}