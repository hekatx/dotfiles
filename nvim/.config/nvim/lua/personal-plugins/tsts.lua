local main = {}

main.declaration_file_path = "/home/quebin/projects/JuntosPlusV4-Web/src/core/translations/Translations.ts"
main.translation_paths = {
	"/home/quebin/projects/JuntosPlusV4-Web/src/core/translations/es-AR/translation.ts",
	"/home/quebin/projects/JuntosPlusV4-Web/src/core/translations/es-CO/translation.ts",
	"/home/quebin/projects/JuntosPlusV4-Web/src/core/translations/es-CR/translation.ts",
	"/home/quebin/projects/JuntosPlusV4-Web/src/core/translations/es-GT/translation.ts",
	"/home/quebin/projects/JuntosPlusV4-Web/src/core/translations/es-NI/translation.ts",
	"/home/quebin/projects/JuntosPlusV4-Web/src/core/translations/es-PA/translation.ts",
	"/home/quebin/projects/JuntosPlusV4-Web/src/core/translations/es-UY/translation.ts",
	"/home/quebin/projects/JuntosPlusV4-Web/src/core/translations/es-VE/translation.ts",
	"/home/quebin/projects/JuntosPlusV4-Web/src/core/translations/es-VE/translation.ts",
	"/home/quebin/projects/JuntosPlusV4-Web/src/core/translations/zh-CN/translation.ts",
	"/home/quebin/projects/JuntosPlusV4-Web/src/core/translations/esp/translation.ts",
	"/home/quebin/projects/JuntosPlusV4-Web/src/core/translations/ptg/translation.ts",
}

main.echo_translation = function(key, translation)
	return nil
end

vim.api.nvim_create_user_command("Tsts", function()
	main.echo_translation()
end, {})
