# Mechatronics: Robotics Kinematics & Reinforcement Learning

This repository contains the MATLAB and Simulink implementations for a comprehensive Mechatronics project, bridging the gap between industrial robotics (Kinematics & Control) and Artificial Intelligence (Reinforcement Learning).

## 🤖 Part 1: Robotics Kinematics & Control 
This section focuses on the mathematical modeling and closed-loop control of robotic manipulators.

### Forward & Inverse Kinematics
* **SCARA Robot (4-DOF):** Modeled the Forward Kinematics (FK) for an R-R-P-R configuration using the Denavit-Hartenberg (DH) systematic approach. The transformation matrices were computed to map the base frame to the tool coordinate system.
* **2-DOF Planar Arm:** Solved both Forward and Inverse Kinematics (IK) using geometric and trigonometric methods.
* **Singularity & Workspace Avoidance:** Implemented protective logic in `IK_2R.m` to prevent mathematical singularities and imaginary outputs when target coordinates fall outside the robot's physical reach.

### Simulink PID Control
* Developed a closed-loop simulation integrating actuator dynamics (transfer functions) and transport delays ($T=0.05$ seconds).
* Evaluated and tuned PID controllers, comparing the stability and computational efficiency of **Task Space Control** versus **Joint Space Control**.

---

## 🧠 Part 2: Reinforcement Learning (RL)
This section explores Markov Decision Processes (MDP) and temporal-difference (TD) learning algorithms applied to grid-world environments.

### Frozen Lake Environment ($4\times4$ Grid)
* Developed a custom grid environment representing a frozen lake with safe states (Frozen), terminal hazard states (Holes), and a Goal state.
* **Algorithms Implemented:** Developed `FrozenLake_RL.m` to compare **Q-Learning** (Off-policy) and **SARSA** (On-policy) algorithms.

### Advanced RL Challenges Addressed
* **Sparse Rewards & Infinite Loops:** Mitigated the issue of agents getting stuck in early-episode infinite wall-collisions by implementing a dynamic **$\epsilon$-decay** (epsilon-decay) mechanism and Max-Step limits per episode.
* **Stochastic Transitions (Slippery Environment):** Analyzed the impact of non-deterministic actions (where the agent has a $1/3$ chance of slipping to unintended directions) on the convergence speed and the conservativeness of the final optimal policy.

---

## 📂 Repository Structure
* `SCARA_FK.m`: Computes transformation matrices for the SCARA robot.
* `FK_2R.m` & `IK_2R.m`: Forward and Inverse kinematics solvers for the 2-DOF arm.
* `FrozenLake_RL.m`: Main RL script executing Q-Learning and SARSA, including performance visualization.
* `Simulink Models`: Loop control architectures mapping Joint and Task spaces.
* `Documentation`: Contains mathematical proofs, DH tables, and moving-average reward convergence plots.

## 🚀 How to Run
1. Open MATLAB and navigate to the repository folder.
2. Run `FrozenLake_RL.m` to train the RL agents and generate the convergence plots (Moving Average Reward).
3. Execute `IK_2R.m` with desired Cartesian coordinates `[x; y]` to calculate joint angles, then verify the position by feeding the output into `FK_2R.m`.
