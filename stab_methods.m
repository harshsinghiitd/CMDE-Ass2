function stab_methods( npts, method )
% Inputs: 1)   npts: number of points along theta.
%         2) method: pick the method of interest.
%           
% Output: The figure corresponding to the stability region. 
%         The latter is highlighted with a shadowed gray area.
%
% Method available:
%    1) method = 'Euler'    (Forward Euler's).
%    2) method = 'BEuler' (Backward Euler's).
%    3) method = 'RK2'    (Rk-2 Method).
%    4) method = 'IEuler'    (Rk-2 Method).

% Main-setup:
theta = linspace(0,2*pi,npts); % Number of points along $\theta$.
clr = [121 100 221]/255;       % User-defined color.
zeta = exp(1i*theta); 
szeta = (0.5)*exp(2*1i*theta);
figure;
set(gca,'fontsize',20,'fontname','times'); 
switch(method)
    
    case('Euler')    % Forward Euler.
        % Solution to the Characteristic Polynomial:
        z = zeta - 1; 
        plot(real(z),imag(z),'-k','linewidth',2); hold on;
        % Stable inside! Fill-in it!
        fill(real(z),imag(z),clr); 
        axis([-2 2 -2 2]);
        ht = title('Forward Euler method');

    case('BEuler') % Backward Euler.
        % Solution to the Characteristic Polynomial:
        z = 1 - conj(zeta);
        % Fill the region with clr color!
        set(gca,'color',clr);
        hold on;
        plot(real(z),imag(z),'-k','linewidth',2); hold on;
        fill(real(z),imag(z),'w'); % Create a "white hole"! 
        axis([-3 3 -3 3]);
        ht = title('Backward Euler method');
    
    case('RK2') %RK-2 Method
        Nx = 301;
        Ny = 301;
        xv = linspace(-3 ,3,Nx);
        yv = linspace(-3,3,Ny);
        [x,y] = meshgrid(xv,yv);
        z = x + 1i*y;
        g = 1 + z + 0.5*z.^2;
        gmag = abs(g);
        contour(x,y,gmag,[1 1],'k-');
        axis([-3 3 -3 3]);
        axis('square');
        xlabel('Real \lambda\Delta t');
        ylabel('Imag \lambda\Delta t');
        grid on;        
        ht = title('Runga Kutta-2 method');
 
    case('IEuler') %RK-2 Method
        x0 = -3;
        x1 = 3;
        Nx = 301;
        y0 = -3;
        y1 = 3;
        Ny = 301;
        xv = linspace(x0,x1,Nx);
        yv = linspace(y0,y1,Ny);
        [x,y] = meshgrid(xv,yv);
        z = x + 1i*y;
        g = 1 + z + 0.5*z.^2;
        gmag = abs(g);
        contour(x,y,gmag,[1 1],'k-');
        axis([x0,x1,y0,y1]);
        axis('square');
        xlabel('Real \lambda\Delta t');
        ylabel('Imag \lambda\Delta t');
        grid on;
        ht = title('Improved Euler method');
end
grid on;
xlabel('$Re(z)$','interpreter','latex');
ylabel('$Im(z)$','interpreter','latex');
set(gca,'fontsize',20,'fontname','times');
set(ht,'fontsize',16,'fontname','times'); 
end

%stab_methods( 20, AB1 )