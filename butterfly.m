syms t t1 t2 l1 l2 X Y;
l1 = 40;
l2 = 40;

for t = 0:0.1:2*pi
    
    X = sin(t)*(exp(cos(t)) - 2*cos(4*t) - sin(t/12)^5);
    Y = cos(t)*(exp(cos(t)) - 2*cos(4*t) - sin(t/12)^5);

    c2 = (X^2 + Y^2 -l1^2 -l2^2)/ (2*l1*l2); 
    s2 = sqrt(abs(1-c2^2));
    t2 = atan2(s2,c2);

    
    c1 = (l1 + l2*c2)*X + l2*s2*Y;
    s1 = (l1 + l2*c2)*Y - l2*s2*X;
    t1 = atan2(s1,c1);
    
    
    %TInh toan dong hoc thuan
    Px = l1*cos(t1) + l2*cos(t1+t2);
    Py = l1*sin(t1) + l2*sin(t1+t2);
    
    subplot(2,1,1);
    axis([0 5 -200 200]);
    plot(t, t1*(180/pi), '-o', t, t2*(180/pi), '*');
    pause(0.1);
    xlabel('t');
    ylabel('THETA');
    hold on
    
    subplot(2,1,2);
    %axis([-3 3 -2 4]);
    plot(Px,Py, '-*');
    pause(0.1);
    xlabel('x cm');
    ylabel('y cm');
    hold on
end