
function [mean_vals,sigma_vals, varnames] = getMeanSigma_path(circuit)
	voff_pd1_mean = -0.177; vth0_pd1_mean = 0.35074; ub_pd1_mean = 1.9384*10^(-18);
	voff_pd2_mean = -0.177; vth0_pd2_mean = 0.35074; ub_pd2_mean = 1.9384*10^(-18);
	voff_wl1_mean = -0.1821; vth0_wl1_mean = 0.32353; ub_wl1_mean = 1.0759*10^(-18);
	voff_wl2_mean = -0.1821; vth0_wl2_mean = 0.32353; ub_wl2_mean = 1.0759*10^(-18);
	voff_pu1_mean = -0.14202; vth0_pu1_mean = -0.29825; ub_pu1_mean = 1.1397*10^(-19);
	voff_pu2_mean = -0.14202; vth0_pu2_mean = -0.29825; ub_pu2_mean = 1.1397*10^(-19);
	voff_pd1_sigma = 0.0525; vth0_pd1_sigma = 0.01945; ub_pd1_sigma = 6.05393*10^(-20);
	voff_pd2_sigma = 0.0525; vth0_pd2_sigma = 0.01945; ub_pd2_sigma = 6.05393*10^(-20);
	voff_wl1_sigma = 0.03942; vth0_wl1_sigma = 0.02855; ub_wl1_sigma = 1.3476*10^(-19);
	voff_wl2_sigma = 0.03942; vth0_wl2_sigma = 0.02855; ub_wl2_sigma = 1.3476*10^(-19);
	voff_pu1_sigma = 1.85736*10^(-4); vth0_pu1_sigma = 0.0365; ub_pu1_sigma = 7.24372*10^(-19);
	voff_pu2_sigma = 1.85736*10^(-4); vth0_pu2_sigma = 0.0365; ub_pu2_sigma = 7.24372*10^(-19);
	mean_vals = [voff_pd1_mean, vth0_pd1_mean, ub_pd1_mean, voff_pd2_mean, vth0_pd2_mean, ub_pd2_mean, voff_wl1_mean, vth0_wl1_mean, ub_wl1_mean, voff_wl2_mean, vth0_wl2_mean, ub_wl2_mean, voff_pu1_mean, vth0_pu1_mean, ub_pu1_mean, voff_pu2_mean, vth0_pu2_mean, ub_pu2_mean];
	sigma_vals = [voff_pd1_sigma, vth0_pd1_sigma, ub_pd1_sigma, voff_pd2_sigma, vth0_pd2_sigma, ub_pd2_sigma, voff_wl1_sigma, vth0_wl1_sigma, ub_wl1_sigma, voff_wl2_sigma, vth0_wl2_sigma, ub_wl2_sigma, voff_pu1_sigma, vth0_pu1_sigma, ub_pu1_sigma, voff_pu2_sigma, vth0_pu2_sigma, ub_pu2_sigma];
	
	varnames = [];
	
	
end