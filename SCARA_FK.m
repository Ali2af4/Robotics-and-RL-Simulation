function T_final = SCARA_FK(q)
    % q = [th1, th2, d3, th4]
    th1 = q(1); th2 = q(2); d3 = q(3); th4 = q(4);
    
    a1 = 20; a2 = 20; d1 = 5; d4 = 2;
    
    A1 = [cos(th1) -sin(th1) 0 a1*cos(th1); sin(th1) cos(th1) 0 a1*sin(th1); 0 0 1 d1; 0 0 0 1];
    A2 = [cos(th2) sin(th2) 0 a2*cos(th2); sin(th2) -cos(th2) 0 a2*sin(th2); 0 0 -1 0; 0 0 0 1];
    A3 = [1 0 0 0; 0 1 0 0; 0 0 1 d3; 0 0 0 1];
    A4 = [cos(th4) -sin(th4) 0 0; sin(th4) cos(th4) 0 0; 0 0 1 d4; 0 0 0 1];
    
    T_final = A1 * A2 * A3 * A4;
end