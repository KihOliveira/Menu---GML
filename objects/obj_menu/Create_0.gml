/// @description Definições do menu

#macro MAIN		0
#macro SETTINGS	1
#macro EXIT		2

//Cria uma estrutura e adiciona o par "volume" (chave) / "valor"
global.dsm_settings = ds_map_create();
ds_map_add(global.dsm_settings, "volume", [5, [0, 10]]);

//Menu principal
options[MAIN, 0] = "Jogar";
options[MAIN, 1] = "Configurações";
options[MAIN, 2] = "Sair";

//Submenu de configurações
options[SETTINGS, 0] = ["Volume: ", "volume"];
options[SETTINGS, 1] = "Tela Cheia";
options[SETTINGS, 2] = "Voltar";

//Submenu de sair
options[EXIT, 0] = "Sim";
options[EXIT, 1] = "Não";

op_max = 0;
index = 0;
menu_level = 0;

//Função para atualizar o valor da estrutura na opção volume
function change_menu_value (h_movement, dsm_key) {

	var map_array = global.dsm_settings[? dsm_key];
	
	//Obtem os limites
	var limits_array = map_array[1];
	var min_limit = limits_array[0];
	var max_limit = limits_array[1];
	
	map_array[@ 0] = clamp(h_movement + map_array[0], min_limit, max_limit);	//Limita e atualiza no array o valor entre o minimo e o maximo
	
}