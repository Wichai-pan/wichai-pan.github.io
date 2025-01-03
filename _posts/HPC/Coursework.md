# Coursework

- [ ] openmp homework
- [ ] openmp tutorial
- [ ] coursework math theory
- [ ] part1.c
- [ ] part1.pdf
- [ ] mpi homework
- [ ] mpi tutorial
- [ ] part2.c
- [ ] part.pdf







## Part 1: OpenMP

In this assessment, you will compile and run a serial two-dimensional reaction-diffusion code, and compare its performance against a parallelized version that you will write. The serial code is made of five functions, init, dxdt, step, norm, and main. The expectations for your parallel implementation are to use OpenMP #pragmas to: (4)

• Parallelise the function init.

• Parallelise the function dxdt.

• Parallelise the function step.

• Parallelise the function norm.

Your code should be in a single C file named part1.c. Your code must compile and run with the provided submission script, and produce the same outputs as the serial code in a file named part1.dat. That does not mean you must develop or test your code with these constraints, only that the submitted code must follow them.

Report

Explain and justify your parallelization strategy, using arguments based in theory covered in the course and your scaling results. Investigate the strong scaling of your implementation. Report scaling results using transferable metrics in your report. Additional questions you may wish to consider in your report are listed below. Your report should be no more than one (1) page (plus images), in a file named part1.pdf.
Questions to consider: 
1. What options for parallelisation are available? 
2. Why are some more suitable than others? 
3. What difficulties arise in the parallelisation? Where are the necessary synchronisation points? 
4. The solution norm requires the generation of a single output number from an N-by-N array; what patterns are available for this function? 
5. How did you avoid data races in your solution? 
6. Is your parallelisation approach the best option? What alternativeapproaches could be used?





## Part 2: MPI

In this part of the assessment, return to the serial implementation of the two-dimensional reaction diffusion system, and parallelize the code using MPI calls, breaking down the original problem domain into distinct regions on each process. Your implementation should:

• Reproduce the initialization of u and v across processes to match the serial code.

• Correctly exchange necessary information of u and v across processes.

• Correctly calculate the norms of u and v across all ranks.

• Correctly evaluate the PDE on all ranks, with consideration for physical and nonphysical boundaries.

Your code should be a single C file called part2.c. Your code should compile and run with the provided submission script (using 4 MPI processes), and produce the same outputs as the serial code in a file named part2.dat. That does not mean you must develop or test your code with these constraints, only that the submitted code must follow them.

Report

Explain and justify your parallelization strategy, using arguments based in theory covered in the course and your scaling results. Investigate the weak scaling of your implementation.
Report scaling results using transferable metrics in your report. Additional questions you may wish to consider in your report are listed below. Your report should be no more than one (1) page (plus images), in a file named part2.pdf.

Questions to consider: 
1. What topologies for distribution are available with 4 MPI processes?
2. Why might some be preferred over others? 
3. What difficulties arise in the parallelisation?
4. The solution norm requires the generation of a single output number from an large distributed array — what patterns are available for this problem?
5. What if we assume that u and/or v change slowly compared to the time-step — do any further optimizations for data exchanges become available? 
6. What are some constraints on the possible domain sizes and number of MPI processes for your solution?

![image-20241228020000965](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/image-20241228020000965.png)

![image-20241228020145440](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/image-20241228020145440.png)

![image-20241228020526925](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/image-20241228020526925.png)

![image-20241228020550570](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/image-20241228020550570.png)

![image-20250103040939044](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/image-20250103040939044.png)

![image-20250103041017927](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/image-20250103041017927.png)

![image-20250103041035377](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/image-20250103041035377.png)