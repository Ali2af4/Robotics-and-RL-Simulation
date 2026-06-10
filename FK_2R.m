function p_out = FK_2R(q)
    % q is a 2x1 vector containing joint angles [q1; q2]
    a1 = 0.4;  % فرض طول لینک اول بر اساس ادامه صورت پروژه
    a2 = 0.3;  % فرض طول لینک دوم بر اساس ادامه صورت پروژه
    
    q1 = q(1);
    q2 = q(2);
    
    x = a1*cos(q1) + a2*cos(q1+q2);
    y = a1*sin(q1) + a2*sin(q1+q2);
    
    p_out = [x; y];
end