function q = IK_2R(p_in)
    % p_in is a 2x1 vector containing target position [x; y]
    a1 = 0.4;
    a2 = 0.3;
    x = p_in(1);
    y = p_in(2);

    % --- تکه کد اضافه شده برای بررسی فضای کاری ---
    r = sqrt(x^2 + y^2);
    if r > (a1 + a2) || r < abs(a1 - a2)
        q = [0; 0];
        return;
    end
    % -------------------------------------------

    % محاسبه زوایا با فرض حالت آرنج-پایین (Elbow-Down)
    D = (x^2 + y^2 - a1^2 - a2^2) / (2 * a1 * a2);
    q2 = atan2(sqrt(1 - D^2), D); 
    q1 = atan2(y, x) - atan2(a2*sin(q2), a1 + a2*cos(q2));

    q = [q1; q2];
end