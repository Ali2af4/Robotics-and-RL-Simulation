# [cite_start]Mechatronics: Robotics Kinematics & Reinforcement Learning [cite: 144, 145]

[cite_start]This repository contains the MATLAB and Simulink implementations for a comprehensive Mechatronics project, bridging the gap between industrial robotics (Kinematics & Control) and Artificial Intelligence (Reinforcement Learning)[cite: 145, 511, 518].

## [cite_start]🤖 Part 1: Robotics Kinematics & Control [cite: 511]
[cite_start]This section focuses on the mathematical modeling and closed-loop control of robotic manipulators[cite: 511, 517].

### [cite_start]Forward & Inverse Kinematics [cite: 515, 516]
* [cite_start]**SCARA Robot (4-DOF):** Modeled the Forward Kinematics (FK) for an R-R-P-R configuration using the Denavit-Hartenberg (DH) systematic approach[cite: 153, 155]. [cite_start]The transformation matrices were computed to map the base frame to the tool coordinate system[cite: 155, 163, 171].
* [cite_start]**2-DOF Planar Arm:** Solved both Forward and Inverse Kinematics (IK) using geometric and trigonometric methods[cite: 202, 206, 211].
* [cite_start]**Singularity & Workspace Avoidance:** Implemented protective logic in `IK_2R.m` to prevent mathematical singularities and imaginary outputs when target coordinates fall outside the robot's physical reach[cite: 279, 281, 282].

### [cite_start]Simulink PID Control [cite: 517]
* [cite_start]Developed a closed-loop simulation integrating actuator dynamics (transfer functions) and transport delays ($T=0.05$ seconds)[cite: 298, 299, 300].
* [cite_start]Evaluated and tuned PID controllers, comparing the stability and computational efficiency of **Task Space Control** versus **Joint Space Control**[cite: 304, 306, 316, 317].

---

## [cite_start]🧠 Part 2: Reinforcement Learning (RL) [cite: 518]
[cite_start]This section explores Markov Decision Processes (MDP) and temporal-difference (TD) learning algorithms applied to grid-world environments[cite: 329, 375, 427].

### [cite_start]Frozen Lake Environment ($4\times4$ Grid) [cite: 669]
* [cite_start]Developed a custom grid environment representing a frozen lake with safe states (Frozen), terminal hazard states (Holes), and a Goal state[cite: 431, 670].
* [cite_start]**Algorithms Implemented:** Developed `FrozenLake_RL.m` to compare **Q-Learning** (Off-policy) and **SARSA** (On-policy) algorithms[cite: 428, 432, 437, 440].

### [cite_start]Advanced RL Challenges Addressed [cite: 456, 461]
* [cite_start]**Sparse Rewards & Infinite Loops:** Mitigated the issue of agents getting stuck in early-episode infinite wall-collisions by implementing a dynamic **$\epsilon$-decay** (epsilon-decay) mechanism and Max-Step limits per episode[cite: 458, 460, 464, 466].
* [cite_start]**Stochastic Transitions (Slippery Environment):** Analyzed the impact of non-deterministic actions (where the agent has a $1/3$ chance of slipping to unintended directions) on the convergence speed and the conservativeness of the final optimal policy[cite: 449, 451, 453, 454].

---

## [cite_start]📂 Repository Structure [cite: 699]
* [cite_start]`SCARA_FK.m`: Computes transformation matrices for the SCARA robot[cite: 168, 515].
* [cite_start]`FK_2R.m` & `IK_2R.m`: Forward and Inverse kinematics solvers for the 2-DOF arm[cite: 229, 244].
* [cite_start]`FrozenLake_RL.m`: Main RL script executing Q-Learning and SARSA, including performance visualization[cite: 432, 433].
* [cite_start]`Simulink Models`: Loop control architectures mapping Joint and Task spaces[cite: 301, 587].
* [cite_start]`Documentation`: Contains mathematical proofs, DH tables, and moving-average reward convergence plots[cite: 157, 470, 508].

## 🚀 How to Run
1. Open MATLAB and navigate to the repository folder.
2. Run `FrozenLake_RL.m` to train the RL agents and generate the convergence plots (Moving Average Reward).
3. Execute `IK_2R.m` with desired Cartesian coordinates `[x; y]` to calculate joint angles, then verify the position by feeding the output into `FK_2R.m`.