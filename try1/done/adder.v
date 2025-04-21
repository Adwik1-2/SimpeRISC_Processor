module adder(
    input a, b,
    output sum,
    input c_in,
    output c_out
);
    wire s1,s2,s3;
    xor g1(s1, a , b);
    xor g2(sum, s1, c_in);
    and g3(s2, s1, c_in);
    and g4(s3, a, b);
    or g5(c_out, s2, s3);


endmodule