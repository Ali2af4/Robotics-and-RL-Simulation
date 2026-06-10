% --- محیط دریاچه یخ‌زده (Frozen Lake) و مقایسه SARSA و Q-Learning ---
clear; clc;

num_episodes = 2000;
alpha = 0.1;      % نرخ یادگیری
gamma = 0.99;     % ضریب تخفیف

% 1:Up, 2:Down, 3:Right, 4:Left
num_states = 16;
num_actions = 4;

% تعریف الگوریتم‌ها برای اجرا
algorithms = {'Q-Learning', 'SARSA'};
rewards_history = zeros(length(algorithms), num_episodes);
Q_tables = cell(1, 2);

for alg_idx = 1:2
    Q = zeros(num_states, num_actions);
    
    for ep = 1:num_episodes
        state = 1; % Start
        done = false;
        ep_reward = 0;
        steps = 0; % شمارنده گام‌ها
        
        % نرخ اکتشاف کاهشی (Epsilon Decay): از 1.0 شروع شده و کم می‌شود
        epsilon = max(0.01, 1.0 - ep / (num_episodes * 0.5));
        
        % انتخاب عمل اولیه برای SARSA
        if rand < epsilon
            action = randi(num_actions);
        else
            [~, action] = max(Q(state, :));
        end
        
        % محدودیت 100 گام برای جلوگیری از گیر کردن در حلقه بی‌نهایت
        while ~done && steps < 100
            steps = steps + 1;
            
            % --- تابع انتقال محیط ---
            next_state = state;
            if action == 1 && state > 4, next_state = state - 4; end % Up
            if action == 2 && state < 13, next_state = state + 4; end % Down
            if action == 3 && mod(state, 4) ~= 0, next_state = state + 1; end % Right
            if action == 4 && mod(state, 4) ~= 1, next_state = state - 1; end % Left
            
            % --- تابع پاداش ---
            reward = 0;
            if next_state == 16 % Goal
                reward = 1;
                done = true;
            elseif ismember(next_state, [6, 8, 12, 13]) % Hole
                reward = 0;
                done = true;
            end
            
            % انتخاب عمل بعدی
            if rand < epsilon
                next_action = randi(num_actions);
            else
                [~, next_action] = max(Q(next_state, :));
            end
            
            % --- آپدیت Q-Table ---
            if strcmp(algorithms{alg_idx}, 'Q-Learning')
                % Q-Learning (Off-policy)
                best_next_q = max(Q(next_state, :));
                if done, best_next_q = 0; end
                Q(state, action) = Q(state, action) + alpha * (reward + gamma * best_next_q - Q(state, action));
                action = next_action; 
            else
                % SARSA (On-policy)
                next_q = Q(next_state, next_action);
                if done, next_q = 0; end
                Q(state, action) = Q(state, action) + alpha * (reward + gamma * next_q - Q(state, action));
                action = next_action; 
            end
            
            state = next_state;
            ep_reward = ep_reward + reward;
        end
        rewards_history(alg_idx, ep) = ep_reward;
    end
    Q_tables{alg_idx} = Q;
end

% --- رسم نمودارها (میانگین متحرک پاداش‌ها) ---
window_size = 100;
smoothed_q = movmean(rewards_history(1,:), window_size);
smoothed_sarsa = movmean(rewards_history(2,:), window_size);

figure;
plot(1:num_episodes, smoothed_q, 'b', 'LineWidth', 1.5); hold on;
plot(1:num_episodes, smoothed_sarsa, 'r', 'LineWidth', 1.5);
title('مقایسه میانگین متحرک پاداش در طول اپیزودها');
xlabel('شماره اپیزود');
ylabel('میانگین پاداش (پنجره ۱۰۰ تایی)');
legend('Q-Learning', 'SARSA', 'Location', 'southeast');
grid on;