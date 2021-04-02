%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'RBC';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('RBC.log');
M_.exo_names = 'epsA';
M_.exo_names_tex = 'epsA';
M_.exo_names_long = 'epsA';
M_.exo_names = char(M_.exo_names, 'epsG');
M_.exo_names_tex = char(M_.exo_names_tex, 'epsG');
M_.exo_names_long = char(M_.exo_names_long, 'epsG');
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
M_.endo_names = char(M_.endo_names, 'tax');
M_.endo_names_tex = char(M_.endo_names_tex, 'tax');
M_.endo_names_long = char(M_.endo_names_long, 'tax');
M_.endo_names = char(M_.endo_names, 'A');
M_.endo_names_tex = char(M_.endo_names_tex, 'A');
M_.endo_names_long = char(M_.endo_names_long, 'A');
M_.endo_names = char(M_.endo_names, 'G');
M_.endo_names_tex = char(M_.endo_names_tex, 'G');
M_.endo_names_long = char(M_.endo_names_long, 'G');
M_.endo_names = char(M_.endo_names, 'X');
M_.endo_names_tex = char(M_.endo_names_tex, 'X');
M_.endo_names_long = char(M_.endo_names_long, 'X');
M_.endo_names = char(M_.endo_names, 'Q');
M_.endo_names_tex = char(M_.endo_names_tex, 'Q');
M_.endo_names_long = char(M_.endo_names_long, 'Q');
M_.endo_names = char(M_.endo_names, 'Z1');
M_.endo_names_tex = char(M_.endo_names_tex, 'Z1');
M_.endo_names_long = char(M_.endo_names_long, 'Z1');
M_.endo_names = char(M_.endo_names, 'RR');
M_.endo_names_tex = char(M_.endo_names_tex, 'RR');
M_.endo_names_long = char(M_.endo_names_long, 'RR');
M_.endo_names = char(M_.endo_names, 'YY');
M_.endo_names_tex = char(M_.endo_names_tex, 'YY');
M_.endo_names_long = char(M_.endo_names_long, 'YY');
M_.endo_names = char(M_.endo_names, 'CC');
M_.endo_names_tex = char(M_.endo_names_tex, 'CC');
M_.endo_names_long = char(M_.endo_names_long, 'CC');
M_.endo_names = char(M_.endo_names, 'HH');
M_.endo_names_tex = char(M_.endo_names_tex, 'HH');
M_.endo_names_long = char(M_.endo_names_long, 'HH');
M_.endo_names = char(M_.endo_names, 'WW');
M_.endo_names_tex = char(M_.endo_names_tex, 'WW');
M_.endo_names_long = char(M_.endo_names_long, 'WW');
M_.endo_names = char(M_.endo_names, 'II');
M_.endo_names_tex = char(M_.endo_names_tex, 'II');
M_.endo_names_long = char(M_.endo_names_long, 'II');
M_.endo_names = char(M_.endo_names, 'KK');
M_.endo_names_tex = char(M_.endo_names_tex, 'KK');
M_.endo_names_long = char(M_.endo_names_long, 'KK');
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
M_.endo_names = char(M_.endo_names, 'LAMBDA');
M_.endo_names_tex = char(M_.endo_names_tex, 'LAMBDA');
M_.endo_names_long = char(M_.endo_names_long, 'LAMBDA');
M_.endo_partitions = struct();
M_.param_names = 'cy';
M_.param_names_tex = 'cy';
M_.param_names_long = 'cy';
M_.param_names = char(M_.param_names, 'gy');
M_.param_names_tex = char(M_.param_names_tex, 'gy');
M_.param_names_long = char(M_.param_names_long, 'gy');
M_.param_names = char(M_.param_names, 'iy');
M_.param_names_tex = char(M_.param_names_tex, 'iy');
M_.param_names_long = char(M_.param_names_long, 'iy');
M_.param_names = char(M_.param_names, 'H_bar');
M_.param_names_tex = char(M_.param_names_tex, 'H\_bar');
M_.param_names_long = char(M_.param_names_long, 'H_bar');
M_.param_names = char(M_.param_names, 'varrho');
M_.param_names_tex = char(M_.param_names_tex, 'varrho');
M_.param_names_long = char(M_.param_names_long, 'varrho');
M_.param_names = char(M_.param_names, 'alp');
M_.param_names_tex = char(M_.param_names_tex, 'alp');
M_.param_names_long = char(M_.param_names_long, 'alp');
M_.param_names = char(M_.param_names, 'betta');
M_.param_names_tex = char(M_.param_names_tex, 'betta');
M_.param_names_long = char(M_.param_names_long, 'betta');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'sigma_c');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_c');
M_.param_names_long = char(M_.param_names_long, 'sigma_c');
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
M_.param_names = char(M_.param_names, 'phiX');
M_.param_names_tex = char(M_.param_names_tex, 'phiX');
M_.param_names_long = char(M_.param_names_long, 'phiX');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 28;
M_.param_nbr = 14;
M_.orig_endo_nbr = 28;
M_.aux_vars = [];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 0;
erase_compiled_function('RBC_static');
erase_compiled_function('RBC_dynamic');
M_.orig_eq_nbr = 28;
M_.eq_nbr = 28;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 7 0;
 1 8 0;
 0 9 0;
 0 10 0;
 0 11 0;
 0 12 0;
 0 13 0;
 0 14 0;
 2 15 0;
 3 16 0;
 0 17 0;
 4 18 0;
 5 19 0;
 0 20 0;
 6 21 0;
 0 22 35;
 0 23 0;
 0 24 0;
 0 25 0;
 0 26 0;
 0 27 0;
 0 28 0;
 0 29 0;
 0 30 0;
 0 31 0;
 0 32 0;
 0 33 36;
 0 34 37;]';
M_.nstatic = 19;
M_.nfwrd   = 3;
M_.npred   = 6;
M_.nboth   = 0;
M_.nsfwrd   = 3;
M_.nspred   = 6;
M_.ndynamic   = 9;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(28, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(14, 1);
M_.NNZDerivatives = [83; 81; -1];
M_.params( 1 ) = 0.6;
cy = M_.params( 1 );
M_.params( 2 ) = 0.2;
gy = M_.params( 2 );
M_.params( 3 ) = 0.2;
iy = M_.params( 3 );
M_.params( 4 ) = 0.33;
H_bar = M_.params( 4 );
M_.params( 6 ) = 0.7;
alp = M_.params( 6 );
M_.params( 5 ) = M_.params(6)*(1-M_.params(4))/(M_.params(6)*(1-M_.params(4))+M_.params(4)*M_.params(1));
varrho = M_.params( 5 );
M_.params( 7 ) = 0.99;
betta = M_.params( 7 );
M_.params( 8 ) = (1/M_.params(7)-1)*M_.params(3)/(1-M_.params(6)-M_.params(3));
delta = M_.params( 8 );
M_.params( 9 ) = 2.0;
sigma_c = M_.params( 9 );
M_.params( 14 ) = 2.0;
phiX = M_.params( 14 );
M_.params( 12 ) = 1;
A_bar = M_.params( 12 );
M_.params( 10 ) = 0.75;
rhoA = M_.params( 10 );
M_.params( 11 ) = 0.75;
rhoG = M_.params( 11 );
M_.params( 13 ) = 0.01;
sigma = M_.params( 13 );
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.Sigma_e(2, 2) = (1)^2;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.irf = 40;
options_.order = 2;
var_list_ = char('YY','CC','II','HH','WW','RR','Q');
info = stoch_simul(var_list_);
save('RBC_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('RBC_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('RBC_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('RBC_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('RBC_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('RBC_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('RBC_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
