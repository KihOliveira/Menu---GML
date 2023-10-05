/// @description Desenha o menu na tela

//Obtem a largura e altura da tela
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

//Divide a altura e a largura pela metade para encontrar o centro da tela
var center_w = gui_w / 2;
var center_h = gui_h / 2;

var margin = 100;	//Valor da distancia entre uma opção e outra
var temp_h = center_h;	//Variável que será utilizada para gerar a nova posição da altura do texto

//Obtem a posição do mouse na tela
var m_x = device_mouse_x_to_gui(0);
var m_y = device_mouse_y_to_gui(0);

///Seleciona a fonte a ser utilizada e alinha o texto no meio
draw_set_font(fnt_menu);
draw_set_halign(fa_center);	
draw_set_valign(fa_middle);

//Imprime todas as opções centralizadas no meio da tela
for(var i = 0; i < op_max; i++){
	temp_h = temp_h + margin;
	
	//Obtem o tamanho do texto
	var string_w = string_width(options[menu_level, i]);
	var string_h = string_height(options[menu_level, i]);
		
	//Utilizando setas
	if(index == i){
		draw_set_color(c_orange);
	}
	
	//Utilizando mouse
	else if(point_in_rectangle(m_x, m_y, center_w - string_w / 2, temp_h - string_h /2,  center_w + string_w / 2, temp_h + string_h /2)){
		draw_set_color(c_orange);	
		index = i;
	}
	else {
			draw_set_color(c_white);
	}
	
	//Checa para ver se a opção é um array ("Volume" é)
	if(is_array(options[menu_level,i])) {
		var menu_array = options[menu_level,i];
		var map_array = global.dsm_settings[? menu_array[1]];	//Obtem o valor contido na estrutura
		var limits_array = map_array[1];	//Obtem o valor limite do array (contido no indice 1 do valor da estrutura)
		var string_menu = menu_array[0] + string(map_array[0]);
		
	} else {
		var string_menu = options[menu_level,i];
	}
	
	draw_text(center_w,temp_h,string_menu);
}




