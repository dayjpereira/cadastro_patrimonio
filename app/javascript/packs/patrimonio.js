document.addEventListener("DOMContentLoaded", () => {
    const departamentoSelect = document.getElementById("departamento_select");
    const funcionarioSelect = document.getElementById("funcionario_select");
  
    if (departamentoSelect) {
      departamentoSelect.addEventListener("change", () => {
        const departamentoId = departamentoSelect.value;
  
        // Limpa o select de funcionários
        funcionarioSelect.innerHTML = '<option value="">Carregando...</option>';
  
        if (departamentoId === "") {
          funcionarioSelect.innerHTML = '<option value="">Selecione um departamento primeiro</option>';
          return;
        }
  
        fetch(`/departamentos/${departamentoId}/funcionarios`)
          .then(response => response.json())
          .then(funcionarios => {
            funcionarioSelect.innerHTML = '<option value="">Selecione um funcionário</option>';
            funcionarios.forEach(func => {
              const option = document.createElement("option");
              option.value = func.id;
              option.text = func.nome;
              funcionarioSelect.appendChild(option);
            });
          });
      });
    }
  });
  