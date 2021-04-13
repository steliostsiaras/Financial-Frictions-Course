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
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'RBC1';
M_.dynare_version = '4.6.3';
oo_.dynare_version = '4.6.3';
options_.dynare_version = '4.6.3';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('RBC1.log');
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'epsA'};
M_.exo_names_tex(1) = {'epsA'};
M_.exo_names_long(1) = {'epsA'};
M_.endo_names = cell(19,1);
M_.endo_names_tex = cell(19,1);
M_.endo_names_long = cell(19,1);
M_.endo_names(1) = {'U'};
M_.endo_names_tex(1) = {'U'};
M_.endo_names_long(1) = {'U'};
M_.endo_names(2) = {'UC'};
M_.endo_names_tex(2) = {'UC'};
M_.endo_names_long(2) = {'UC'};
M_.endo_names(3) = {'UH'};
M_.endo_names_tex(3) = {'UH'};
M_.endo_names_long(3) = {'UH'};
M_.endo_names(4) = {'R'};
M_.endo_names_tex(4) = {'R'};
M_.endo_names_long(4) = {'R'};
M_.endo_names(5) = {'C'};
M_.endo_names_tex(5) = {'C'};
M_.endo_names_long(5) = {'C'};
M_.endo_names(6) = {'W'};
M_.endo_names_tex(6) = {'W'};
M_.endo_names_long(6) = {'W'};
M_.endo_names(7) = {'H'};
M_.endo_names_tex(7) = {'H'};
M_.endo_names_long(7) = {'H'};
M_.endo_names(8) = {'Y'};
M_.endo_names_tex(8) = {'Y'};
M_.endo_names_long(8) = {'Y'};
M_.endo_names(9) = {'K'};
M_.endo_names_tex(9) = {'K'};
M_.endo_names_long(9) = {'K'};
M_.endo_names(10) = {'I'};
M_.endo_names_tex(10) = {'I'};
M_.endo_names_long(10) = {'I'};
M_.endo_names(11) = {'A'};
M_.endo_names_tex(11) = {'A'};
M_.endo_names_long(11) = {'A'};
M_.endo_names(12) = {'G'};
M_.endo_names_tex(12) = {'G'};
M_.endo_names_long(12) = {'G'};
M_.endo_names(13) = {'T'};
M_.endo_names_tex(13) = {'T'};
M_.endo_names_long(13) = {'T'};
M_.endo_names(14) = {'KY'};
M_.endo_names_tex(14) = {'KY'};
M_.endo_names_long(14) = {'KY'};
M_.endo_names(15) = {'IY'};
M_.endo_names_tex(15) = {'IY'};
M_.endo_names_long(15) = {'IY'};
M_.endo_names(16) = {'CY'};
M_.endo_names_tex(16) = {'CY'};
M_.endo_names_long(16) = {'CY'};
M_.endo_names(17) = {'RK'};
M_.endo_names_tex(17) = {'RK'};
M_.endo_names_long(17) = {'RK'};
M_.endo_names(18) = {'rK'};
M_.endo_names_tex(18) = {'rK'};
M_.endo_names_long(18) = {'rK'};
M_.endo_names(19) = {'LAMBDA'};
M_.endo_names_tex(19) = {'LAMBDA'};
M_.endo_names_long(19) = {'LAMBDA'};
M_.endo_partitions = struct();
M_.param_names = cell(14,1);
M_.param_names_tex = cell(14,1);
M_.param_names_long = cell(14,1);
M_.param_names(1) = {'cy'};
M_.param_names_tex(1) = {'cy'};
M_.param_names_long(1) = {'cy'};
M_.param_names(2) = {'iy'};
M_.param_names_tex(2) = {'iy'};
M_.param_names_long(2) = {'iy'};
M_.param_names(3) = {'ky'};
M_.param_names_tex(3) = {'ky'};
M_.param_names_long(3) = {'ky'};
M_.param_names(4) = {'H_bar'};
M_.param_names_tex(4) = {'H\_bar'};
M_.param_names_long(4) = {'H_bar'};
M_.param_names(5) = {'alp'};
M_.param_names_tex(5) = {'alp'};
M_.param_names_long(5) = {'alp'};
M_.param_names(6) = {'gy'};
M_.param_names_tex(6) = {'gy'};
M_.param_names_long(6) = {'gy'};
M_.param_names(7) = {'betta'};
M_.param_names_tex(7) = {'betta'};
M_.param_names_long(7) = {'betta'};
M_.param_names(8) = {'delta'};
M_.param_names_tex(8) = {'delta'};
M_.param_names_long(8) = {'delta'};
M_.param_names(9) = {'rhoA'};
M_.param_names_tex(9) = {'rhoA'};
M_.param_names_long(9) = {'rhoA'};
M_.param_names(10) = {'rhoG'};
M_.param_names_tex(10) = {'rhoG'};
M_.param_names_long(10) = {'rhoG'};
M_.param_names(11) = {'A_bar'};
M_.param_names_tex(11) = {'A\_bar'};
M_.param_names_long(11) = {'A_bar'};
M_.param_names(12) = {'sigma'};
M_.param_names_tex(12) = {'sigma'};
M_.param_names_long(12) = {'sigma'};
M_.param_names(13) = {'omega'};
M_.param_names_tex(13) = {'omega'};
M_.param_names_long(13) = {'omega'};
M_.param_names(14) = {'phi'};
M_.param_names_tex(14) = {'phi'};
M_.param_names_long(14) = {'phi'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 19;
M_.param_nbr = 14;
M_.orig_endo_nbr = 19;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.orig_eq_nbr = 19;
M_.eq_nbr = 19;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 4 0;
 1 5 23;
 0 6 0;
 0 7 0;
 0 8 0;
 0 9 0;
 0 10 0;
 0 11 0;
 2 12 0;
 0 13 0;
 3 14 0;
 0 15 0;
 0 16 0;
 0 17 0;
 0 18 0;
 0 19 0;
 0 20 24;
 0 21 0;
 0 22 25;]';
M_.nstatic = 14;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 1;
M_.nsfwrd   = 3;
M_.nspred   = 3;
M_.ndynamic   = 5;
M_.dynamic_tmp_nbr = [3; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
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
  12 , 'name' , 'Stochastic Discount Factor' ;
  13 , 'name' , 'Arbitrage' ;
  14 , 'name' , 'Government Spending' ;
  15 , 'name' , 'Taxes' ;
  16 , 'name' , 'TFP process' ;
  17 , 'name' , 'KY' ;
  18 , 'name' , 'IY' ;
  19 , 'name' , 'CY' ;
};
M_.mapping.U.eqidx = [1 ];
M_.mapping.UC.eqidx = [2 4 5 12 ];
M_.mapping.UH.eqidx = [3 5 ];
M_.mapping.R.eqidx = [4 13 ];
M_.mapping.C.eqidx = [1 2 10 19 ];
M_.mapping.W.eqidx = [5 7 ];
M_.mapping.H.eqidx = [1 3 6 7 ];
M_.mapping.Y.eqidx = [6 7 8 10 14 17 18 19 ];
M_.mapping.K.eqidx = [6 8 11 17 ];
M_.mapping.I.eqidx = [10 11 18 ];
M_.mapping.A.eqidx = [6 16 ];
M_.mapping.G.eqidx = [10 14 15 ];
M_.mapping.T.eqidx = [15 ];
M_.mapping.KY.eqidx = [17 ];
M_.mapping.IY.eqidx = [18 ];
M_.mapping.CY.eqidx = [19 ];
M_.mapping.RK.eqidx = [9 13 ];
M_.mapping.rK.eqidx = [8 9 ];
M_.mapping.LAMBDA.eqidx = [12 13 ];
M_.mapping.epsA.eqidx = [16 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [2 9 11 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(19, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(14, 1);
M_.endo_trends = struct('deflator', cell(19, 1), 'log_deflator', cell(19, 1), 'growth_factor', cell(19, 1), 'log_growth_factor', cell(19, 1));
M_.NNZDerivatives = [54; -1; -1; ];
M_.static_tmp_nbr = [3; 1; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(6) = 0.2;
gy = M_.params(6);
M_.params(4) = 0.33;
H_bar = M_.params(4);
M_.params(5) = 0.7;
alp = M_.params(5);
M_.params(7) = 0.99;
betta = M_.params(7);
M_.params(14) = 1;
phi = M_.params(14);
M_.params(8) = 0.025;
delta = M_.params(8);
r     = 1/betta; 
M_.params(3) = (1-M_.params(5))/(r-1+M_.params(8));
ky = M_.params(3);
M_.params(2) = (1-M_.params(5))*M_.params(8)/(r-1+M_.params(8));
iy = M_.params(2);
M_.params(1) = 1-M_.params(2)-M_.params(6);
cy = M_.params(1);
M_.params(13) = M_.params(5)*M_.params(1)^(-1)*1/M_.params(4)^(1+M_.params(14));
omega = M_.params(13);
M_.params(11) = 1;
A_bar = M_.params(11);
M_.params(9) = 0.75;
rhoA = M_.params(9);
M_.params(10) = 0.75;
rhoG = M_.params(10);
M_.params(12) = 0.01;
sigma = M_.params(12);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.irf = 40;
options_.order = 1;
var_list_ = {'Y';'C';'I';'H';'W';'R'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
save('RBC1_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('RBC1_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('RBC1_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('RBC1_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('RBC1_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('RBC1_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('RBC1_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
