function p = bezier(t, p1, p2, p3, p4)
    t_matrix = [t^3 t^2 t 1];
    M = [-1 3 -3 1; 3 -6 3 0; -3 3 0 0; 1 0 0 0];
    p_vector =[p1; p2; p3; p4];
    p = t_matrix * M * p_vector;
    