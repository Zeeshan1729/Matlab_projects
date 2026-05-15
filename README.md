#LETS GO...

# Power System Congestion Detection and Mitigation using GSDF

This project demonstrates transmission congestion detection and mitigation in a power system using GSDF (Generation Shift Distribution Factors) and generator redispatch techniques.

The simulation is implemented in MATLAB using the MATPOWER toolbox on the IEEE 9-bus test system.

## Features

- IEEE 9-Bus Power System Simulation
- Congestion Detection
- Full GSDF Matrix Calculation
- Generator Sensitivity Analysis
- Iterative Congestion Mitigation
- Generator Redispatch Strategy

## Working Principle

1. Load IEEE 9-bus system from MATPOWER.
2. Artificially reduce transmission line limit to create congestion.
3. Run AC power flow analysis.
4. Detect overloaded transmission lines.
5. Compute GSDF matrix by perturbing generator outputs.
6. Select the generator with highest impact on congested line.
7. Redispatch generation iteratively until congestion is removed.

## GSDF Formula

GSDF measures how transmission line flow changes with generator output variation:

\[
GSDF = \frac{\Delta P_{line}}{\Delta P_{gen}}
\]

## Requirements

- MATLAB
- MATPOWER Toolbox

## How to Run

```matlab
run('filename.m')
```

## Output

The program displays:

- Congested lines
- Line flows and limits
- GSDF matrix
- Initial and final line flows
- Iteration count
- Congestion mitigation status

## Concepts Covered

- Power Flow Analysis
- Transmission Congestion
- Sensitivity Analysis
- Generator Redispatch
- Power System Operation
- MATPOWER Simulation

## Future Improvements

- Optimal Power Flow (OPF)
- Multi-line congestion management
- FACTS device integration
- Renewable energy integration
- Economic dispatch optimization