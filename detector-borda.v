module detector_borda (
    input clk,
    input rst,
    input [1:0] entrada,
    output reg [1:0] detector
);
    
    // Registrador para armazenar o valor anterior da entrada
    reg [1:0] entrada_anterior;
    
    // Lógica sequencial com reset assíncrono
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            entrada_anterior <= 2'b00;
            detector <= 2'b00;
        end else begin
            // Detecta borda de subida: valor atual é 1 e anterior era 0
            detector <= (~entrada_anterior) & entrada;
            // Atualiza o registrador com o valor atual
            entrada_anterior <= entrada;
        end
    end

endmodule