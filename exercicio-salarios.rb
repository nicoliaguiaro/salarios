class Funcionario
    attr_reader :matricula, :nome
    def initialize(matricula, nome, salario)
        @matricula = matricula
        @nome = nome
        @salario = salario
    end
end

class Analista < Funcionario
    def initialize(matricula, nome, salario, valor_beneficios)
        super matricula, nome, salario
        @valor_beneficios = valor_beneficios
    end
    def calcula_vencimentos
        return @salario + @valor_beneficios
    end
end

class Gerente < Funcionario
    def initialize(matricula, nome, salario, percentual_bonus)
        super matricula, nome, salario
        @percentual_bonus = percentual_bonus
    end
    def calcula_vencimentos
        return @salario + (@salario * @percentual_bonus)
    end
end

class FolhaPagamento
    def self.calcula_total(funcionarios)
        resultado = 0.0
        for i in 0..funcionarios.size-1
            resultado = resultado + funcionarios[i].calcula_vencimentos
        end
        return resultado
    end
end

funcionarios = Array.new
funcionarios.push Analista.new(1, "John Lennon", 2000.0, 500.0)
funcionarios.push Analista.new(2, "Paul McCartney", 2500.0, 500.0)
funcionarios.push Analista.new(3, "George Harisson", 3000.0, 500.0)
funcionarios.push Gerente.new(4, "Ringo Star", 2000.0, 0.5)

puts FolhaPagamento.calcula_total funcionarios