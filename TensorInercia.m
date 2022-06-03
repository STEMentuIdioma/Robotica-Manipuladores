function [JCMi_i] = TensorInercia(l_i, h_i, w_i, rho_i)

syms x y z 'real'   %coordenadas
syms l h w 'real'   %geometria del objeto
syms rho            %propiedades de inercia del cuerpo

r = [x; y; z];      %Vector de posición respecto al centro de masa
J = rho*(r'*r*sym(eye(3))-r*r');   %La expresion dentro de la integral
J = int(int(int(J, x, -l/2, l/2), y, -h/2, h/2), z, -w/2, w/2);
JCMi_i = subs(J, [l, h, w, rho], [l_i, h_i, w_i, rho_i]);       %Se subtituyen los valores del usuario
end

