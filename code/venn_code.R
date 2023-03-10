####Venn diagrams
library(ggVennDiagram)
library(ggplot2)
library(readr)

#load the files:
file.names <- list.files(path = "data/",
                         pattern = "sig*", ignore.case = TRUE,
                         full.names = TRUE)

filenameonly <- read_csv("data/filenameonly.txt")


for (k in 1:length(file.names)){

  assign(paste0(filenameonly$x[k]) , read.csv(file.names[k]))
}

##rename the columns to the previous names

# 24 hour data sets -------------------------------------------------------


colnames(sigVDA24)<- c("ENTREZID","SYMBOL","logFC","AveExpr","t","P.Value","adj.P.Val","B")
colnames(sigVDX24)<- c("ENTREZID","SYMBOL","logFC","AveExpr","t","P.Value","adj.P.Val","B")
colnames(sigVEP24)<- c("ENTREZID","SYMBOL","logFC","AveExpr","t","P.Value","adj.P.Val","B")
colnames(sigVMT24)<- c("ENTREZID","SYMBOL","logFC","AveExpr","t","P.Value","adj.P.Val","B")
colnames(sigVTR24)<- c("ENTREZID","SYMBOL","logFC","AveExpr","t","P.Value","adj.P.Val","B")




total24 <-list(sigVDA24$ENTREZID,sigVDX24$ENTREZID,sigVEP24$ENTREZID,sigVMT24$ENTREZID)
in_common24 <-c(sigVDA24$ENTREZID,sigVDX24$ENTREZID,sigVEP24$ENTREZID,sigVMT24$ENTREZID)
length(unique(in_common24))

ggVennDiagram(total24,
              category.names = c("Daunorubicin","Doxorubicin","Epirubicin","Mitoxantrone"),
              show_intersect = FALSE,
              set_color = "black",
              label = "both",
              label_percent_digit = 1,
              label_size = 3,
              label_alpha = 0,
              label_color = "black",
              edge_lty = "solid", set_size = )+
  scale_x_continuous(expand = expansion(mult = .2))+
  scale_fill_gradient(low = "purple", high = "yellow")+
  labs(title = "24 hour comparison of significant genes", caption = "n = 8887 genes")+
  theme(plot.title = element_text(size = rel(1.5), hjust = 0.5))









# 3hour data sets ---------------------------------------------------------


colnames(sigVDA3)<- c("ENTREZID","SYMBOL","logFC","AveExpr","t","P.Value","adj.P.Val","B")
colnames(sigVDX3)<- c("ENTREZID","SYMBOL","logFC","AveExpr","t","P.Value","adj.P.Val","B")
colnames(sigVEP3)<- c("ENTREZID","SYMBOL","logFC","AveExpr","t","P.Value","adj.P.Val","B")
colnames(sigVMT3)<- c("ENTREZID","SYMBOL","logFC","AveExpr","t","P.Value","adj.P.Val","B")
colnames(sigVTR3)<- c("ENTREZID","SYMBOL","logFC","AveExpr","t","P.Value","adj.P.Val","B")




total3 <- list(sigVDA3$ENTREZID,sigVDX3$ENTREZID,sigVEP3$ENTREZID,sigVMT3$ENTREZID)
in_common3 <- c(sigVDA3$SYMBOL,sigVDX3$SYMBOL,sigVEP3$SYMBOL,sigVMT3$SYMBOL)
length(unique(in_common3))

ggVennDiagram(total3,
              category.names = c("Daunorubicin","Doxorubicin","Epirubicin","Mitoxantrone"),
              show_intersect = FALSE,
              set_color = "black",
              label = "both",
              label_percent_digit = 1,
              label_size = 3.5,
              label_alpha = 0,
              label_color = "black",
              edge_lty = "solid") +
  scale_x_continuous(expand = expansion(mult = .2))+
  scale_fill_gradient(low = "red2", high = "yellow")+
  labs(title = "3 hour comparison of significant genes", caption = "n = 554 genes")+
  theme(plot.title = element_text(size = rel(1.5), hjust = 0.5))

# Dauno comp --------------------------------------------------------------

Dauncomp <- list(sigVDA24$ENTREZID,sigVDA3$ENTREZID)
in_commonDa <- c(sigVDA24$ENTREZID,sigVDA3$ENTREZID)
length(unique(in_commonDa))
ggVennDiagram(Dauncomp,
              category.names = c("Daunorubicin-24","Daunorubicin-3"),
              show_intersect = FALSE,
              set_color = "black",
              label = "both",
              label_percent_digit = 1,
              label_size = 3,
              label_alpha = 0,
              label_color = "black",
              edge_lty = "solid", set_size = )+
  scale_x_continuous(expand = expansion(mult = .2))+
  scale_fill_gradient(low = "light blue", high = "yellow")+
  labs(title = "Comparision of Dauno 3h v 24h", caption = "n = 7732 genes")+
  theme(plot.title = element_text(size = rel(1.5), hjust = 0.5))
Davenlist <- intersect(Dauncomp[[1]],Dauncomp[[2]])


# Doxocomp ----------------------------------------------------------------
Doxcomp <- list(sigVDX24$ENTREZID,sigVDX3$ENTREZID)
in_commonDx <- c(sigVDX24$ENTREZID,sigVDX3$ENTREZID)
length(unique(in_commonDx))
ggVennDiagram(Doxcomp,
              category.names = c("Doxorubicin-24","Doxorubicin-3"),
              show_intersect = FALSE,
              set_color = "black",
              label = "both",
              label_percent_digit = 1,
              label_size = 3,
              label_alpha = 0,
              label_color = "black",
              edge_lty = "solid", set_size = )+
  scale_x_continuous(expand = expansion(mult = .2))+
  scale_fill_gradient(low = "light blue", high = "yellow")+
  labs(title = "Comparision of Doxo 3h v 24h", caption = "n = 6808 genes")+
  theme(plot.title = element_text(size = rel(1.5), hjust = 0.5))
Dxvenlist <- intersect(Doxcomp[[1]],Doxcomp[[2]])
length(intersect(Dxvenlist,Davenlist))## 7 of DX are in DA
# Epi Comp ----------------------------------------------------------------

Epicomp <- list(sigVEP24$ENTREZID,sigVEP3$ENTREZID)
in_commonEp <- c(sigVEP24$ENTREZID,sigVEP3$ENTREZID)
length(unique(in_commonEp))



ggVennDiagram(Epicomp,
              category.names = c("Epirubicin-24","Epirubicin-3"),
              show_intersect = FALSE,
              set_color = "black",
              label = "both",
              label_percent_digit = 1,
              label_size = 3,
              label_alpha = 0,
              label_color = "black",
              edge_lty = "solid", set_size = )+
  scale_x_continuous(expand = expansion(mult = .2))+
  scale_fill_gradient(low = "light blue", high = "yellow")+
  labs(title = "Comparision of Epi 3h v 24h", caption = "n = 6858 genes")+
  theme(plot.title = element_text(size = rel(1.5), hjust = 0.5))

Epvenlist <- intersect(Epicomp[[1]],Epicomp[[2]])
qA <- (intersect(Epvenlist , Davenlist))##76 are are in da
qB <- (intersect(Dxvenlist, Epvenlist))#y are in Ep from Dx
ACintersect <- intersect(qA,qB)##total of 6 are in all 3 comparisons
ggVennDiagram(qA,qB
              )

# Mito comp ---------------------------------------------------------------
Mitocomp <- list(sigVMT24$ENTREZID,sigVMT3$ENTREZID)
in_commonMt <-c(sigVMT24$ENTREZID,sigVMT3$ENTREZID)
length(unique(in_commonMt))

ggVennDiagram(Mitocomp,
              category.names = c("Mitoxantrone-24","Mitoxantrone-3"),
              show_intersect = FALSE,
              set_color = "black",
              label = "both",
              label_percent_digit = 1,
              label_size = 3,
              label_alpha = 0,
              label_color = "black",
              edge_lty = "solid", set_size = )+
  scale_x_continuous(expand = expansion(mult = .21))+
  scale_fill_gradient(low = "light blue", high = "yellow")+
  labs(title = "Comparision of Mito 3h v 24h", caption = "n = 1251 genes")+
  theme(plot.title = element_text(size = rel(1.5), hjust = 0.5))
Mtvenlist <- intersect(Mitocomp[[1]],Mitocomp[[2]])
intersect(Mtvenlist,ACintersect)


# AC 3 and 24 comparison -----------------------------------------------------------

ACcomp <- list(sigVDA24$ENTREZID,sigVDX24$ENTREZID,sigVEP24$ENTREZID,sigVDA3$ENTREZID,sigVDX3$ENTREZID,sigVEP3$ENTREZID)
in_commonAC <-c(sigVDA24$ENTREZID,sigVDX24$ENTREZID,sigVEP24$ENTREZID,sigVDA3$ENTREZID,sigVDX3$ENTREZID,sigVEP3$ENTREZID)
length(unique(in_commonAC))
in_common24AC <- c(sigVDA24$ENTREZID,sigVDX24$ENTREZID,sigVEP24$ENTREZID)
AC24hoursig <- (unique(in_common24AC))
ggVennDiagram(ACcomp,
              category.names = c("Daunorubicin-24","Doxorubicin-24", "Epirubicin-24","Daunorubicin-3","Doxorubicin-3", "Epirubicin-3"),
              show_intersect = FALSE,
              set_color = "black",
              label = "both",
              label_percent_digit = 1,
              label_size = 3,
              label_alpha = 0,
              label_color = "black",
              edge_lty = "solid", set_size = )+
  scale_x_continuous(expand = expansion(mult = .21))+
  scale_fill_gradient(low = "red", high = "yellow")+
  labs(title = "Comparision AC 3h v 24h", caption = "n = 8925 genes")+
  theme(plot.title = element_text(size = rel(1.5), hjust = 0.5))

4


#Detach all  packages
detachAllPackages <- function() {

  basic.packages <- c("package:stats","package:graphics","package:grDevices","package:utils","package:datasets","package:methods","package:base","package:workflowr")

  package.list <- search()[ifelse(unlist(gregexpr("package:",search()))==1,TRUE,FALSE)]

  package.list <- setdiff(package.list,basic.packages)

  if (length(package.list)>0)  for (package in package.list) detach(package, character.only=TRUE)

}

detachAllPackages()

