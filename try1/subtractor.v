module subtractor(
    input a,b,
    output diff,
    input b_in,
    output b_out
);
    wire s1,s2,s3,s4;
    xor g1(s1, a , b);
    xor g2(diff, s1, b_in);
    and g3(s2, ~a, b);
    and g4(s3, ~a, b_in);
    and g5(s4, b, b_in);
    or g6(b_out, s2, s3, s4);

endmodule