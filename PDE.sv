`default_nettype none
//`timescale 1ps / 1ps

module f1(output wire[7:0] dy1, input wire[7:0] y2);
  assign dy1 = y2;
endmodule

module f2(output wire[7:0] dy2, input wire[7:0] y1);
  assign dy2 = -y1;
endmodule

module RK4(output wire[7:0] newy1, newy2, input wire[7:0] y1, y2, dt);
  wire[7:0] k1, k2, k3, k4, g1, g2, g3, g4;
  f1 f1i1(k1, y2);
  f2 f2i1(g1, y1);
  
  //f1 f1i2(k2, y2 + dt*g1/2);
  //f2 f2i2(g2, y1 + dt*k1/2);
  f1 f1i2(k2, y2 + g1/40);
  f2 f2i2(g2, y1 + k1/40);
  
  //f1 f1i3(k3, y2 + dt*g2/2);
  //f2 f2i3(g3, y1 + dt*k2/2);
  f1 f1i3(k3, y2 + g2/40);
  f2 f2i3(g3, y1 + k2/40);
  
  //f1 f1i4(k4, y2 + dt*g3);
  //f2 f2i4(g4, y1 + dt*k3);
  f1 f1i4(k4, y2 + g3);
  f2 f2i4(g4, y1 + k3);
  
  //assign newy1 = y1 + dt*(k1 + 2*k2 + 2*k3 + k4)/6;
  //assign newy2 = y2 + dt*(g1 + 2*g2 + 2*g3 + g4)/6;
  wire[7:0] s1,s2,s3,s4,s5;
  assign s1 = k1/120;
  assign s2 = k2/60;
  assign s3 = k3/60;
  assign s4 = k4/120;
  assign s5 = s1 + s2 + s3 + s4;
  
  wire[7:0] p1,p2,p3,p4,p5;
  assign p1 = g1/120;
  assign p2 = g2/60;
  assign p3 = g3/60;
  assign p4 = g4/120;
  assign p5 = p1 + p2 + p3 + p4;
  
  assign newy1 = y1 + s5;
  assign newy2 = y2 + p5;
endmodule







