# Robotics Coursework

MATLAB/Simulink homework from an undergraduate Robotics course (Sharif University of Technology), covering rigid-body kinematics through motion planning for serial manipulators and mobile robots.

Each `HW#/` folder contains:
- `assignment.pdf` — the problem statement
- `report.pdf` — my written solution and analysis
- `code/` — MATLAB scripts implementing the solution
- `model/` — Simulink models and SolidWorks CAD parts, where the assignment involved simulation (not every homework has one)

## Topics by assignment

| # | Topic | Key files |
|---|---|---|
| [HW1](HW1) | Rotation & translation matrices (rigid-body transforms) | `Rot.m`, `Trans.m` |
| [HW2](HW2) | Forward kinematics of a 3-link manipulator + Simulink model | `HW2.m`, `model/HW2_Model.slx` |
| [HW3](HW3) | Inverse kinematics | `InvKin.m`, `model/HW3_Model.slx` |
| [HW4](HW4) | Jacobian computation | `JcbCalc.m` |
| [HW5](HW5) | Trajectory tracking / dynamic simulation of the manipulator | `model/HW5_Model_1.slx`, `model/HW5_Model_2.slx` (result videos included) |
| [HW6](HW6) | Motion planning: potential-field path generation, random walk | `Path_generator.m`, `random_walk.m` |
| [HW7](HW7) | Path planning via Dijkstra's algorithm on a graph | `dijkstra.m`, `graph_generator.m` |
| [HW8](HW8) | Final Simulink control model | `model/HW8_Model.slx` |

## Tools

MATLAB, Simulink, and SolidWorks (link/part CAD models used in the Simulink simulations).
