%%% exercise 9: compare the efficiency of 4 root finding algorithm in
%%% computing prime root for the function f = x^n - d, with d =
%%% [2,97] and n = [2,5]

%%% first initialize an array consisting number from 0 to 100
a = [1:100];
%%% figure out which number is prime
d = isprime(a);

display("d   n   Bisection   Int Lin   Secants   Newton");
for i = 1:100
    for n=2:5
        if d(i) == true
            %initialize the function f
            f = @(x) x.^n - i;
            %calculate the derivative function
            fp = @(x) n*x.^(n - 1);
            bis = -1;
            int = -1;
            sec = -1;
            new = -1;
            %bisection method
            [x,fx,M,s] = Bisection(f, 0, i, 1e-10,1e-10,1e3,0);
            if s == 0
                bis = M;
            end
            %interpolation
            [x,fx,M,s] = Interpolation(f,0,i,1e-10,1e3,0);
            if s == 0
                int = M;
            end
            %secant
            [x,fx,M,s] = Secant(f,0,i,1e-10,1e3,0);
            if s == 0
                sec = M;
            end
            %newton
            [x,fx,M,s] = Newton(f, fp, i/2, 1e3, 0);
            if s == 0
                new = M;
            end
            fprintf("%d    %d    %d    %d    %d    %d\n",[n,i,bis, int, sec, new]);
        end
    end
end

%%% after running the program, we got a table displaying the iteration
%%% needed by each root finding method. Because I could not find a way to
%%% print out the "*", I denote the error as -1 iteration. From the table.
%%% we can see that
%%% even though the secant method and the newton method both produce the
%%% result in very little iteration, they don't necessarily output the
%%% result. However, even though the bisection method require more
%%% iteration, it almost always produce something.
     