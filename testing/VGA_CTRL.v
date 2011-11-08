/*
 * VGA timing generator
 *
 */

module VGA_CTRL( Reset, VSync, HSync, Clk50, PClk, Row, Col, Row0, Col0, Active );
    input Reset;
    output VSync;
    output HSync;
    input Clk50;

    // outputs to data generator
    output PClk;		// pixel clock
    output Row0;		// pulse when Row == 0
    output Col0;		// pulse when Col == 0
    output [9:0] Col;		// next column
    output [8:0] Row;		// next row
    output Active;		//

reg PClk;			// pixel clock
reg Row0;			// pulse when Row == 0
reg Col0;			// pulse when Col == 0
reg [12:0] HClock;
reg [11:0] VClock;
assign Col = HClock[9:0];
assign Row = VClock[8:0];
assign Active = HClock[11] & VClock[10];
assign VSync = VClock[9];
assign HSync = HClock[10];

/*
 * VGA timing information.
 */
parameter 
    HSYNC   = 10'd95,
    HBACK   = 10'd47,
    HACTIVE = 10'd639,
    HFRONT  = 10'd15;

parameter
    VSYNC   = 9'd1,
    VBACK   = 9'd28,
    VACTIVE = 9'd479,
    VFRONT  = 9'd9;

wire HStart = ( HClock == {3'b101, HBACK} );
wire VStart = ( VClock == {3'b101, VBACK} );

/*
 * make 25 MHz pixelclock
 */
always @(posedge Clk50)
       PClk <= Reset ? 0 : ~PClk;

/*
 * Horizontal timing state machine
 */
always @(posedge Clk50) 
begin
   if( Reset ) 
	begin
		HClock <= 0;
		Col0 <= 0;
   end 
	else if( PClk ) 
	begin
		casex( HClock )
	    { 3'bxx0, HSYNC   } : HClock <= { 3'b101, 10'd0 };
	    { 3'b101, HBACK   } : HClock <= { 3'b011, 10'd0 };
	    { 3'bx11, HACTIVE } : HClock <= { 3'b001, 10'd0 };
	    { 3'b001, HFRONT  } : HClock <= { 3'b100, 10'd0 };

	    default:
		HClock <= { HClock[12:10], HClock[9:0] + 10'd1 };
	endcase
    end
    Col0 <= HStart;
end

/*
 * Vertical timing state machine
 */
always @(posedge Clk50) begin
    if( Reset ) begin
	VClock <= 0;
	Row0 <= 0;
    end else if( PClk & HStart ) begin
	casex ( VClock )
	    { 3'bxx0, VSYNC   } : VClock <= { 3'b101, 9'd0 };
	    { 3'b101, VBACK   } : VClock <= { 3'b011, 9'd0 };
	    { 3'bx11, VACTIVE } : VClock <= { 3'b001, 9'd0 };
	    { 3'b001, VFRONT  } : VClock <= { 3'b100, 9'd0 };

	    default:
		VClock <= { VClock[11:9], VClock[8:0] + 9'd1};
	endcase
    end
    Row0 <= HStart & VStart;
end

endmodule
