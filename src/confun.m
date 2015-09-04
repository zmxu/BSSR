function [c, ceq] = confun(x)
x = reshape(x,3,3);
%nonlinear inequality constraints
c = [];
%nonlinear equality constraints
ceq = [sum(x(:,1).^2)-1;
    sum(x(:,2).^2)-1;
    x(:,1)'*x(:,2)];