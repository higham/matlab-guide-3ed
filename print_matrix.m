function print_matrix(x, fmt, file, fw, ltx, ex)
%PRINT_MATRIX    Print formatted matrix to Command Window or file.
%   PRINT_MATRIX(X, fmt, file, fw, ltx, ex) prints the matrix X according 
%   to the fprintf-style format specified by the string fmt.
%   Default: fmt = '%9.2e'.
%   If fmt is a cell array of strings then its j'th entry will be used
%   to format the j'th column, with cyclic re-use of entries as necessary.
%   fw: fieldwidth of every number (default: automatic).
%   file: filename for output or empty for output to Command Window.
%   ltx = 1 for LaTeX tabular format, else ltx = 0 (default).
%   ex = 1 for delete plus and leading zeros in exponent,
%   else ex = 0 (default).

if nargin < 2 | isempty(fmt), fmt = '%9.2e'; end
if nargin < 3, file = []; end
if nargin < 4, fw = []; end
if nargin < 5 | isempty(ltx), ltx = 0; end
if nargin < 6, ex = 0; end
if isstr(fmt), fmt = {fmt}; end % Ensure fmt is cell array. 

[m,n] = size(x);
if isempty(file)
    fid = 1;  % Output to screen.
else
    fid = fopen(file,'w');
end  

% Conversions for removing plus and leading zeros in exponents.
exps = {'e+'  'e'; 'e00 '   ' '; 'e0'   'e'; 'e-00' 'e-' ; 'e-0'  'e-'};

for i=1:m
    for j=1:n
        fmtj = fmt{1+mod(j-1,length(fmt))}; % Format string for j'th col.
        str = sprintf([fmtj ' '], x(i,j));
        if ex
          for k=1:length(exps)
            str = strrep(str,exps{k,1},exps{k,2});
          end  
        end
        if fw
           str = [str char(32*ones(1,fw))];
           str = str(1:fw);
        end   
        fprintf(fid,'%s ', str)
        if ltx && j<n, fprintf(fid,'& '); end
    end
    if ltx, fprintf(fid,'\\\\'); end
    fprintf(fid,'\n');
end
if ~isempty(file), fclose(fid); end