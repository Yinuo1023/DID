******数据合并整理过程略******
******变量生成******
gen nvcposition=iv/x
***did变量生成
gen treat=0
replace treat=1 if ustrregexm(province,"ZhJ|TiJ|ShH|ChQ|AnH|HeN|GuD|SiC|LiN|ShD")
gen post=0
replace post=1 if year>=2017
gen did=treat*post
******设置面板数据******
xtset number year
******缩尾处理******
winsor2 nvcposition ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital,replace cuts(1 99)
*******描述性统计*******
xtsum nvcposition did ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital
outreg2 using "描述性统计", sum(detail) replace word excel dec(3)keep(nvcposition did ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital) sortvar(nvcposition did ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital)eqkeep(N mean sd min max p50)
*******相关系数分析*******
pwcorr_a nvcposition did ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital, star1(0.01) star5(0.05) star10(0.1)
logout, save(相关系数) word replace:pwcorr_a nvcposition did ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital
******vif检验******
reg nvcposition did ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital
estat vif
******基准回归******
reg nvcposition did
est store a1
reghdfe nvcposition did ,absorb(province year) vce(r)
est store a2
reg nvcposition did ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital
est store a3
reghdfe nvcposition did ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital ,absorb(province year) vce(r)
est store a4 
outreg2 [a1 a2 a3 a4] using "回归结果.doc", word title(Test)  stats(coef tstat) replace bdec(3) tdec(2)sortvar(nvcposition did ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital )
******中介效应检验（产业集聚效应）******
reghdfe nvcposition did ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital ,absorb(province year) vce(r)
est store a51
reghdfe HHI did ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital ,absorb(province year) vce(r)
est store a52
reghdfe nvcposition did HHI ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital ,absorb(province year) vce(r)
est store a53
outreg2 [a51 a52 a53] using "产业聚集中介效应回归结果.doc", word title(Test)  stats(coef tstat) replace bdec(3) tdec(2)sortvar(nvcposition did ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital )
******中介效应检验（外资进入效应）******
reghdfe nvcposition did ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital ,absorb(province year) vce(r)
est store a71
reghdfe ln_FDI did ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital ,absorb(province year) vce(r)
est store a72
reghdfe nvcposition did ln_FDI ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital ,absorb(province year) vce(r)
est store a73
outreg2 [a71 a72 a73] using "外资进入中介效应回归结果.doc", word title(Test)  stats(coef tstat) replace bdec(3) tdec(2)sortvar(nvcposition did ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital )
******平行趋势检验******
gen post_5=1 if year==2012
replace post_5=0 if year!=2012
gen post_2=1 if year==2015
replace post_2=0 if year!=2015
gen before5=treat*post_3
gen before2=treat*post_1
reghdfe nvcposition before5 before2 ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital,absorb(province year) vce(cluster province)
est store a1
outreg2 [a1] using "平行趋势检验.doc", word title(Test) stats(coef tstat)
replace bdec(3) tdec(2)sortvar(nvcposition before3 before1 ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital)
******增加控制变量******
reghdfe nvcposition did ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital ln_income instruc,absorb(province year) vce(r)
est store a1 
outreg2 [a1] using "增加控制变量.doc", word title(Test)  stats(coef tstat) replace bdec(3) tdec(2)sortvar(nvcposition did ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital ln_income instruc)
******安慰剂检验******
cd C:\Users\21937\Desktop  
cap erase "simulations.dta"
permute did beta=_b[did] se=_se[did] df=e(df_m), reps(1000) rseed(777) saving ("simulations.dta"):nvcposition did ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital
use "simulations.dta", clear 
gen t_value = beta/se 
gen p_value =2*ttail(df,abs(beta/se))
dpplot beta , xline (0.252,lp( dash )) xtitle (" Estimator ") ytitle ("Density") 
dpplot t_value, xtitle (" t-value ") ytitle (" Density ")
dpplot p_value, xtitle ("p-value") ytitle (" Density")
twoway (scatter p_value beta)(kdensity beta, yaxis(2))
******南北地区异质性检验******
xtile group=1 if province=="LiN"|province=="JiL"|province=="HeL"|province=="HeB"|province=="ShX"|province=="NeM"|province=="ShX1"|province=="GaS"|province=="QiH"|province=="NiX"|province=="XiJ"|province=="BeJ"|province=="TiJ"
replace group=2 if group !=1
reghdfe nvcposition did ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital ,absorb(province year) vce(r) ,if group==1
est store north
reghdfe nvcposition did ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital ,absorb(province year) vce(r), if group==2
est store south
outreg2 [north south] using "南北方异质性.doc", word title(Test)  stats(coef tstat) replace bdec(3) tdec(2)sortvar(nvcposition did ln_pergdp ln_gov ln_trade ln_tradeopen ln_capital )