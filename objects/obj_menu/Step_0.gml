/// @description Seleção das opções

//Checa se as teclas foram pressionadas
var up = keyboard_check_pressed(vk_up);
var down = keyboard_check_pressed(vk_down);
var left = keyboard_check_pressed(vk_left);
var right = keyboard_check_pressed(vk_right);
var select = keyboard_check_pressed(vk_enter);
var mouse_left = mouse_check_button_pressed(mb_left);

var i = window_get_fullscreen();

index += down - up;
var h_movement =  right - left;

op_max = array_length(options[menu_level]);	//Tamanho do nível atual do vetor de opções

//Faz com que a posição selecionada esteja dentro do tamanho do array
if (index >= op_max){
	index = 0;
}
if (index < 0){
	index = op_max-1;
}

//Opções dos menus
if (select || mouse_left || (is_array(options[menu_level,index]) && (h_movement !=0))){
	
var check_menu_level = menu_level; 

	switch(menu_level){
		
		//Menu principal
		case MAIN:
			switch (index) {
				case 0: //Jogar
					room_goto(rm_gameplay);
					break;
				case 1:	//Configurações
					menu_level = SETTINGS;
					break;
				case 2:	//Sair
					menu_level = EXIT;
					break;
			}
		break;
		
		//Submenu de configurações
		case SETTINGS:
			switch (index) {
				case 0:	//Volume
					change_menu_value(h_movement, "volume");
					break;
				case 1:	//Tela cheia
					if( i == false){
						window_set_fullscreen(true);
					}
					else if( i == true){
						window_set_fullscreen(false);
					}
					break;
				case 2:	//Voltar
					menu_level = MAIN;
					break;
			}
		break;
		
		//Submenu de sair
		case EXIT:
			switch (index) {
				case 0:	//Sim
					game_end();
					break;
				case 1:	//Não
					menu_level = MAIN;
					break;
			}
		break;
	}
	
	//Corrige o tamanho do array
	if(check_menu_level != menu_level){
		index = 0;
	}
	op_max = array_length(options[menu_level]);
}