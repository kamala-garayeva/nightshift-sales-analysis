data$satish_tarixi=dmy_hm(data$satish_tarixi)
> data$saat=hour(data$satish_tarixi)
> gece_datasi=subset(data,data$saat==23 | data$saat<6)
> table(gece_datasi$saat)

0     1     2     3     4     5    23 
18274 18081 18243 18759 18043 17976 17881 
> data$mehsul_qiymet=as.numeric(data$mehsul_qiymet)
> attach(data)
The following objects are masked from kompot:
  
  ...1, bonus_kart, endirim_kompaniya, magaza_ad, magaza_lat, magaza_long, mehsul_ad,
mehsul_kateqoriya, mehsul_kodu, mehsul_qiymet, satish_kodu, satish_tarixi
> netice=data %>% group_by(magaza_ad) %>% summarise(toplam_dovriyye=sum(mehsul_qiymet))
> netice=data %>% group_by(magaza_ad) %>% summarise(toplam_dovriyye=sum(mehsul_qiymet,na.rm = T))
> write.csv(netice, "magaza_dovriyye.csv", row.names = FALSE)
> 