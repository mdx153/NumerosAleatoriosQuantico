namespace numerosAleatoriosQuantico {

   open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;

    operation GeradorDeBitAleatorio() : Result {
        
        use q = Qubit(); //Alocação de Qubits
        H(q); //Superposição 
        return M(q); //Medição
    }

    operation GeradorDeNumeroAleatorio(max : Int) : Int {
        mutable output = 0; 
        repeat {
            mutable bits = new Result[0]; 
            for idxBit in 1..BitSizeI(max) {
                set bits += [GeradorDeBitAleatorio()]; 
            }
            set output = ResultArrayAsInt(bits);
        } until (output <= max);
        return output;
    }

    @EntryPoint()
    operation ExemploDeNumeroAleatorio() : Int {
        let max = 50;
        Message($"Exemplo de número aleatorio entre 0 e {max}: ");
        return GeradorDeNumeroAleatorio(max);
    }
}
