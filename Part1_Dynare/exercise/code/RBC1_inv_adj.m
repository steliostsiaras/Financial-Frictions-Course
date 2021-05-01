%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'RBC1_inv_adj';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('RBC1_inv_adj.log');
M_.exo_names = 'epsA';
M_.exo_names_tex = 'epsA';
M_.exo_names_long = 'epsA';
M_.endo_names = 'U';
M_.endo_names_tex = 'U';
M_.endo_names_long = 'U';
M_.endo_names = char(M_.endo_names, 'UC');
M_.endo_names_tex = char(M_.endo_names_tex, 'UC');
M_.endo_names_long = char(M_.endo_names_long, 'UC');
M_.endo_names = char(M_.endo_names, 'UH');
M_.endo_names_tex = char(M_.endo_names_tex, 'UH');
M_.endo_names_long = char(M_.endo_names_long, 'UH');
M_.endo_names = char(M_.endo_names, 'R');
M_.endo_names_tex = char(M_.endo_names_tex, 'R');
M_.endo_names_long = char(M_.endo_names_long, 'R');
M_.endo_names = char(M_.endo_names, 'C');
M_.endo_names_tex = char(M_.endo_names_tex, 'C');
M_.endo_names_long = char(M_.endo_names_long, 'C');
M_.endo_names = char(M_.endo_names, 'W');
M_.endo_names_tex = char(M_.endo_names_tex, 'W');
M_.endo_names_long = char(M_.endo_names_long, 'W');
M_.endo_names = char(M_.endo_names, 'H');
M_.endo_names_tex = char(M_.endo_names_tex, 'H');
M_.endo_names_long = char(M_.endo_names_long, 'H');
M_.endo_names = char(M_.endo_names, 'Y');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y');
M_.endo_names_long = char(M_.endo_names_long, 'Y');
M_.endo_names = char(M_.endo_names, 'K');
M_.endo_names_tex = char(M_.endo_names_tex, 'K');
M_.endo_names_long = char(M_.endo_names_long, 'K');
M_.endo_names = char(M_.endo_names, 'I');
M_.endo_names_tex = char(M_.endo_names_tex, 'I');
M_.endo_names_long = char(M_.endo_names_long, 'I');
M_.endo_names = char(M_.endo_names, 'A');
M_.endo_names_tex = char(M_.endo_names_tex, 'A');
M_.endo_names_long = char(M_.endo_names_long, 'A');
M_.endo_names = char(M_.endo_names, 'G');
M_.endo_names_tex = char(M_.endo_names_tex, 'G');
M_.endo_names_long = char(M_.endo_names_long, 'G');
M_.endo_names = char(M_.endo_names, 'T');
M_.endo_names_tex = char(M_.endo_names_tex, 'T');
M_.endo_names_long = char(M_.endo_names_long, 'T');
M_.endo_names = char(M_.endo_names, 'KY');
M_.endo_names_tex = char(M_.endo_names_tex, 'KY');
M_.endo_names_long = char(M_.endo_names_long, 'KY');
M_.endo_names = char(M_.endo_names, 'IY');
M_.endo_names_tex = char(M_.endo_names_tex, 'IY');
M_.endo_names_long = char(M_.endo_names_long, 'IY');
M_.endo_names = char(M_.endo_names, 'CY');
M_.endo_names_tex = char(M_.endo_names_tex, 'CY');
M_.endo_names_long = char(M_.endo_names_long, 'CY');
M_.endo_names = char(M_.endo_names, 'RK');
M_.endo_names_tex = char(M_.endo_names_tex, 'RK');
M_.endo_names_long = char(M_.endo_names_long, 'RK');
M_.endo_names = char(M_.endo_names, 'rK');
M_.endo_names_tex = char(M_.endo_names_tex, 'rK');
M_.endo_names_long = char(M_.endo_names_long, 'rK');
M_.endo_names = char(M_.endo_names, 'LAMBDA');
M_.endo_names_tex = char(M_.endo_names_tex, 'LAMBDA');
M_.endo_names_long = char(M_.endo_names_long, 'LAMBDA');
M_.endo_names = char(M_.endo_names, 'Xi');
M_.endo_names_tex = char(M_.endo_names_tex, 'Xi');
M_.endo_names_long = char(M_.endo_names_long, 'Xi');
M_.endo_names = char(M_.endo_names, 'Q');
M_.endo_names_tex = char(M_.endo_names_tex, 'Q');
M_.endo_names_long = char(M_.endo_names_long, 'Q');
M_.endo_partitions = struct();
M_.param_names = 'cy';
M_.param_names_tex = 'cy';
M_.param_names_long = 'cy';
M_.param_names = char(M_.param_names, 'iy');
M_.param_names_tex = char(M_.param_names_tex, 'iy');
M_.param_names_long = char(M_.param_names_long, 'iy');
M_.param_names = char(M_.param_names, 'ky');
M_.param_names_tex = char(M_.param_names_tex, 'ky');
M_.param_names_long = char(M_.param_names_long, 'ky');
M_.param_names = char(M_.param_names, 'H_bar');
M_.param_names_tex = char(M_.param_names_tex, 'H\_bar');
M_.param_names_long = char(M_.param_names_long, 'H_bar');
M_.param_names = char(M_.param_names, 'alp');
M_.param_names_tex = char(M_.param_names_tex, 'alp');
M_.param_names_long = char(M_.param_names_long, 'alp');
M_.param_names = char(M_.param_names, 'gy');
M_.param_names_tex = char(M_.param_names_tex, 'gy');
M_.param_names_long = char(M_.param_names_long, 'gy');
M_.param_names = char(M_.param_names, 'betta');
M_.param_names_tex = char(M_.param_names_tex, 'betta');
M_.param_names_long = char(M_.param_names_long, 'betta');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'rhoA');
M_.param_names_tex = char(M_.param_names_tex, 'rhoA');
M_.param_names_long = char(M_.param_names_long, 'rhoA');
M_.param_names = char(M_.param_names, 'rhoG');
M_.param_names_tex = char(M_.param_names_tex, 'rhoG');
M_.param_names_long = char(M_.param_names_long, 'rhoG');
M_.param_names = char(M_.param_names, 'A_bar');
M_.param_names_tex = char(M_.param_names_tex, 'A\_bar');
M_.param_names_long = char(M_.param_names_long, 'A_bar');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'omega');
M_.param_names_tex = char(M_.param_names_tex, 'omega');
M_.param_names_long = char(M_.param_names_long, 'omega');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'phiX');
M_.param_names_tex = char(M_.param_names_tex, 'phiX');
M_.param_names_long = char(M_.param_names_long, 'phiX');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 21;
M_.param_nbr = 15;
M_.orig_endo_nbr = 21;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('RBC1_inv_adj_static');
erase_compiled_function('RBC1_inv_adj_dynamic');
M_.orig_eq_nbr = 21;
M_.eq_nbr = 21;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 6 0;
 1 7 27;
 0 8 0;
 0 9 0;
 0 10 0;
 0 11 0;
 0 12 0;
 0 13 0;
 2 14 0;
 3 15 0;
 4 16 0;
 0 17 0;
 0 18 0;
 0 19 0;
 0 20 0;
 0 21 0;
 0 22 28;
 0 23 0;
 0 24 29;
 0 25 30;
 5 26 31;]';
M_.nstatic = 13;
M_.nfwrd   = 3;
M_.npred   = 3;
M_.nboth   = 2;
M_.nsfwrd   = 5;
M_.nspred   = 5;
M_.ndynamic   = 8;
M_.equations_tags = {
  1 , 'name' , 'Utility' ;
  2 , 'name' , 'Marginal utility of consumption' ;
  3 , 'name' , 'Marginal disutility of labour' ;
  4 , 'name' , 'Euler equation' ;
  5 , 'name' , 'Labour supply FOC' ;
  6 , 'name' , 'Production Function' ;
  7 , 'name' , 'MPL' ;
  8 , 'name' , 'MPK' ;
  9 , 'name' , 'Gross Rate' ;
  10 , 'name' , 'Resource Cosntraint' ;
  11 , 'name' , 'Law of Motion for capital' ;
  14 , 'name' , 'Stochastic Discount Factor' ;
  15 , 'name' , 'Arbitrage' ;
  16 , 'name' , 'Government Spending' ;
  17 , 'name' , 'Taxes' ;
  18 , 'name' , 'TFP process' ;
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(21, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(15, 1);
M_.NNZDerivatives = [65; -1; -1];
M_.params( 6 ) = 0.2;
gy = M_.params( 6 );
M_.params( 4 ) = 0.33;
H_bar = M_.params( 4 );
M_.params( 5 ) = 0.7;
alp = M_.params( 5 );
M_.params( 7 ) = 0.99;
betta = M_.params( 7 );
M_.params( 14 ) = 1;
phi = M_.params( 14 );
M_.params( 8 ) = 0.025;
delta = M_.params( 8 );
r     = 1/betta; 
M_.params( 3 ) = (1-M_.params(5))/(r-1+M_.params(8));
ky = M_.params( 3 );
M_.params( 2 ) = (1-M_.params(5))*M_.params(8)/(r-1+M_.params(8));
iy = M_.params( 2 );
M_.params( 1 ) = 1-M_.params(2)-M_.params(6);
cy = M_.params( 1 );
M_.params( 13 ) = M_.params(5)*M_.params(1)^(-1)*1/M_.params(4)^(1+M_.params(14));
omega = M_.params( 13 );
load Phix_value;
set_param_value('phiX'    ,phiX); 
M_.params( 11 ) = 1;
A_bar = M_.params( 11 );
M_.params( 9 ) = 0.75;
rhoA = M_.params( 9 );
M_.params( 10 ) = 0.75;
rhoG = M_.params( 10 );
M_.params( 12 ) = 0.01;
sigma = M_.params( 12 );
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.irf = 40;
options_.nograph = 1;
options_.order = 1;
var_list_ = char('Y','C','I','H','W','R','Q');
info = stoch_simul(var_list_);
save('RBC1_inv_adj_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('RBC1_inv_adj_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('RBC1_inv_adj_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('RBC1_inv_adj_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('RBC1_inv_adj_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('RBC1_inv_adj_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('RBC1_inv_adj_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
