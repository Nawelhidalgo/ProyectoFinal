
insert into etapas (IdEtapa,NombreEtapa)
values('123','Reposo'),
      ('124','Siembra'),
      ('125','Germinación'),
      ('126','Crecimiento vegetativo'),
      ('127','Floración'),
      ('128','Fructificación'),
      ('129','Cosecha');

INSERT INTO Plantas (IdPlanta,Nombre,Foto, Descripcion, Sustrato, Riego, Luz, Temperatura, Fertilizacion, Mantenimiento, Conservacion, Semillas) VALUES
('V0000','Zapallo','/static/Imagenes/imagenes_Planta/zapallo.jpg','El zapallo es una planta de la familia de las cucurbitáceas. De crecimiento rastrero o trepador, sus frutos comestibles se utilizan ampliamente en la cocina por su valor nutricional y versatilidad.','Prefiere suelos sueltos, con buen drenaje y ricos en materia orgánica.',' Riego moderado, profundo, sin encharcar. No mojar hojas para evitar hongos.','Sol directo al menos 6 horas al día. Ideal para su crecimiento y frutos.','Climas cálidos, entre 20 °C y 30 °C. No tolera heladas.','Compost o abono equilibrado (NPK). No abusar del nitrógeno.','Eliminar malezas y hojas secas. Vigilar plagas comunes.','El zapallo es anual, pero podés recolectar sus semillas para plantar de nuevo.','Usá zapallos maduros, extraé las semillas, enjuagalas y dejalas secar varios días. Guardalas en un frasco seco.'),
('V0001','Lechuga','/static/Imagenes/imagenes_Planta/lechuga.jpg', 'La lechuga es una hortaliza de hojas verdes tiernas, ideal para ensaladas. Su crecimiento es rápido y es perfecta para huertas urbanas.', 'Sustrato fértil, bien aireado y con buen drenaje. Rica en materia orgánica.', 'Riego frecuente, especialmente en días calurosos. Mantener el suelo húmedo pero sin encharcar.', 'Sol parcial o sombra ligera, sobre todo en verano para evitar que espigue.', 'Prefiere temperaturas frescas, entre 10 y 20 °C.', 'Fertilización ligera semanal con compost o té de humus.', 'Eliminar hojas dañadas y mantener el área libre de malezas.', 'Consumir fresca tras cosecha. No se conserva por mucho tiempo.', 'Cosechar semillas cuando la planta florezca y se seque. Guardar en frasco seco.'),
('V0002','Papa','/static/Imagenes/imagenes_Planta/papa.jpg', 'La papa es un tubérculo subterráneo ampliamente consumido. Se cultiva por sus raíces engrosadas ricas en almidón.', 'Suelo suelto, profundo, con buen drenaje. Ideal si es ligeramente ácido.', 'Riego moderado, evitando encharcar. Reducir al final del ciclo.', 'Sol pleno durante la mayor parte del día.', 'Prefiere climas templados: entre 15 y 25 °C.', 'Abono equilibrado, con énfasis en potasio.', 'Aporcar tierra sobre los tallos a medida que crecen.', 'Conservar en lugar oscuro, seco y ventilado.', 'Usar trozos de papa con brotes para nueva siembra.'),
('V0003','Remolacha','/static/Imagenes/imagenes_Planta/remolacha.jpg', 'La remolacha es una raíz de color rojo intenso, rica en antioxidantes y hierro. Sus hojas también son comestibles.', 'Sustrato húmedo, suelto y sin piedras. Mejor con compost.', 'Riego regular. Evitar que el suelo se seque completamente.', 'Sol directo preferido, pero también crece en semisombra.', 'Climas frescos, entre 10 y 24 °C.', 'Fertilizante bajo en nitrógeno, una vez al mes.', 'Aclarar plántulas para evitar hacinamiento.', 'Conservar en heladera. Las hojas deben consumirse rápido.', 'Cosechar semillas de plantas maduras y secas.'),
('V0004','Zanahoria','/static/Imagenes/imagenes_Planta/zanahoria.jpg', 'La zanahoria es una raíz comestible de color anaranjado, rica en betacarotenos. De cultivo simple y adaptable.', 'Sustrato suelto, profundo y arenoso. Sin piedras ni compactación.', 'Riego constante y moderado. No dejar secar el suelo.', 'Requiere pleno sol para buen desarrollo de la raíz.', 'Clima ideal entre 10 y 25 °C.', 'Abono suave, no excesivo. Evitar nitrógeno para no afectar la raíz.', 'Eliminar malezas y aclarar las plantas.', 'Almacenamiento en cajón de arena seco o refrigerado.', 'Dejar algunas plantas florecer para extraer semillas.'),
('V0005','Pepino','/static/Imagenes/imagenes_Planta/pepino.jpg', 'El pepino es un fruto alargado y refrescante. Su planta es trepadora y de rápido crecimiento.', 'Suelo fértil y húmedo, bien drenado. Enriquecer con compost.', 'Riego abundante y frecuente, sin mojar las hojas.', 'Sol pleno, al menos 6 horas diarias.', 'Clima cálido, entre 18 y 30 °C.', 'Fertilización cada 15 días con abono líquido.', 'Guiar en espalderas y eliminar brotes innecesarios.', 'Cosechar antes de que amarillee. Usar fresco o encurtido.', 'Germina en pocos días. Extraer semillas de frutos maduros.'),
('V0006','Calabaza','/static/Imagenes/imagenes_Planta/calabaza.jpg', 'La calabaza es una planta rastrera de frutos grandes, ideal para sopas y purés. Necesita espacio y sol.', 'Suelo muy fértil, profundo y rico en materia orgánica.', 'Riego espaciado pero abundante, sin mojar las hojas.', 'Sol pleno durante todo el día.', 'Clima cálido: 20 a 30 °C. No resiste heladas.', 'Aplicar compost o abono orgánico cada 2-3 semanas.', 'Podar brotes laterales para fortalecer la planta.', 'Conservar frutos en lugar seco y fresco. Duran meses.', 'Extraer semillas de frutos maduros y secarlas bien.'),
('V0007','Berenjena','/static/Imagenes/imagenes_Planta/berenjena.jpg', 'La berenjena es un fruto morado, carnoso y nutritivo. Su planta es exigente en calor y luz.', 'Sustrato bien drenado, fértil y suelto.', 'Riego regular, evitando mojar el follaje.', 'Pleno sol. Necesita al menos 6-8 horas de luz directa.', 'Clima ideal entre 20 y 35 °C.', 'Fertilizante rico en fósforo cada 2 semanas.', 'Usar tutores para sostener el peso de los frutos.', 'Cosechar cuando la piel esté brillante. No dejar madurar de más.', 'Recolectar semillas de frutos sobremaduros.'),
('V0008','Cebolla','/static/Imagenes/imagenes_Planta/cebolla.jpg', 'La cebolla es un bulbo muy usado en la cocina. De crecimiento lento, necesita cuidados regulares.', 'Suelo liviano, bien aireado, sin compactación.', 'Riego escaso en etapas finales. Moderado al inicio.', 'Sol pleno desde la mañana.', 'Climas frescos a templados: 10 a 25 °C.', 'Evitar exceso de fertilizantes, sobre todo nitrógeno.', 'Mantener el cultivo limpio. No remover bulbos en crecimiento.', 'Secar al sol tras la cosecha antes de guardar.', 'Usar bulbillos o recolectar semillas al final del ciclo.'),
('V0009','Ajo','/static/Imagenes/imagenes_Planta/ajo.jpg', 'El ajo es un bulbo de fuerte sabor, con propiedades medicinales y culinarias. Muy resistente.', 'Suelo arenoso, suelto y bien drenado.', 'Riego mínimo. Evitar totalmente el encharcamiento.', 'Sol directo la mayor parte del día.', 'Ideal entre 10 y 25 °C. Tolera algo de frío.', 'No necesita mucha fertilización.', 'Cosechar cuando las hojas se sequen por completo.', 'Guardar en lugar seco y aireado. Puede colgarse.', 'Se siembra a partir de dientes individuales.'),
('V0010','Morron','/static/Imagenes/imagenes_Planta/morron.jpg', 'El morrón o pimiento dulce es una hortaliza de frutos coloridos. Muy valorado en gastronomía.', 'Suelo fértil, suelto y con buena humedad.', 'Riego regular y uniforme. Evitar que se seque o se encharque.', 'Sol pleno, al menos 6 horas por día.', 'Temperaturas cálidas, entre 18 y 30 °C.', 'Fertilización balanceada cada 2 semanas.', 'Usar tutores para sostener ramas pesadas.', 'Cosechar cuando el fruto esté firme y con color intenso.', 'Extraer semillas de frutos maduros y secarlas.');

INSERT INTO Plantas (IdPlanta,Nombre,Foto, Descripcion, Sustrato, Riego, Luz, Temperatura, Fertilizacion, Mantenimiento, Conservacion, Semillas) VALUES
('F0001','Frutilla','/static/Imagenes/imagenes_Planta/frutilla.jpg', 'La frutilla es una planta de pequeño porte que produce frutos dulces y jugosos. Es ideal para cultivar en macetas o jardines, con alto valor ornamental y gastronómico.', 'Sustrato rico en materia orgánica, con buen drenaje. Ideal una mezcla de compost, tierra negra y perlita.', 'Riego frecuente, sin encharcar. Mantener humedad constante.', 'Sol directo al menos 4-6 horas al día. Tolera semisombra.', 'Temperaturas templadas: entre 15 y 25 °C.', 'Fertilizante orgánico cada 15 días en época de crecimiento.', 'Retirar hojas secas y frutos pasados. Proteger de hormigas y pájaros.', 'Consumir frescas o refrigerar por pocos días. También congelan bien.', 'Extraer semillas de la superficie de la fruta madura y dejar secar.'),
('F0002','Mandarina','/static/Imagenes/imagenes_Planta/mandarina.jpg', 'La mandarina es un árbol frutal cítrico que da frutos dulces, fáciles de pelar. Muy usado en patios y huertas familiares.', 'Suelo profundo, bien aireado, con buen drenaje. Rico en nutrientes.', 'Riego moderado, más frecuente en verano. No tolera encharcamientos.', 'Sol pleno. Necesita buena exposición solar para fructificar.', 'Clima cálido a templado: 18 a 30 °C. Protegido de heladas.', 'Fertilizar con abono cítrico 3 veces al año (primavera, verano, otoño).', 'Podas ligeras en invierno para dar forma. Control de plagas como cochinillas.', 'Frutos pueden conservarse por varias semanas en lugar fresco.', 'Plantar semillas secas de fruta madura o usar injertos para mejor producción.'),
('F0003','Limon','/static/Imagenes/imagenes_Planta/limon.jpg', 'El limón es un cítrico muy utilizado por su jugo ácido y fragancia. El árbol es perenne y florece varias veces al año.', 'Sustrato suelto, rico en humus, con buen drenaje. Ideal con pH ligeramente ácido.', 'Riego regular, evitando tanto el exceso como la sequedad total.', 'Necesita pleno sol, al menos 6 horas diarias.', 'Climas cálidos, entre 20 y 30 °C. Resguardar de heladas intensas.', 'Fertilizar con abonos ricos en potasio y micronutrientes para frutos.', 'Podar ramas secas y mantener aireada la copa.', 'Cosechar cuando la piel está lisa y de color intenso. Se conserva bien a temperatura ambiente.', 'Secar semillas de frutos maduros o injertar para árboles productivos.'),
('F0004','Manzana','/static/Imagenes/imagenes_Planta/manzana.jpg', 'La manzana es una fruta muy cultivada por su sabor, textura y duración. Su árbol caducifolio requiere frío invernal para dar buenos frutos.', 'Sustrato profundo, fértil, con buen drenaje. Agradece mezcla de tierra negra y compost.', 'Riego moderado. Evitar excesos en períodos fríos.', 'Necesita pleno sol para florecer y dar fruta.', 'Climas templados a fríos. Necesita horas de frío invernal.', 'Fertilizante balanceado antes de primavera.', 'Podas anuales para airear la copa y estimular floración.', 'Frutas se conservan por semanas si están bien almacenadas.', 'Germinar semillas con estratificación o usar injertos.'),
('F0005','Naranja','/static/Imagenes/imagenes_Planta/naranja.jpg', 'La naranja es una fruta cítrica muy popular por su dulzura y contenido en vitamina C. El árbol es perenne y de crecimiento moderado.', 'Suelo fértil, profundo, bien drenado. Ideal con compost y pH neutro.', 'Riego moderado y regular. Mayor necesidad en floración y fructificación.', 'Sol pleno indispensable para una buena cosecha.', 'Climas cálidos, entre 20 y 30 °C. No resiste heladas.', 'Fertilización con abono cítrico 2 a 3 veces al año.', 'Podas leves para mantener forma y evitar ramas muertas.', 'Conservar frutos en lugar fresco. Su cáscara protege bien.', 'Semillas deben lavarse, secarse y pueden germinar en algodón o tierra.'),
('F0006','Pera','/static/Imagenes/imagenes_Planta/pera.jpg', 'La pera es una fruta de pulpa suave y jugosa. Su árbol es caducifolio, y puede adaptarse bien a jardines amplios.', 'Sustrato profundo, fértil, con buena aireación. Prefiere suelos francos.', 'Riego moderado. Incrementar en floración y fructificación.', 'Requiere al menos 6 horas de sol diario para buena cosecha.', 'Climas templados, con inviernos fríos y veranos suaves.', 'Fertilizar en primavera con compost y abono de liberación lenta.', 'Podas invernales para estimular producción. Cuidar contra hongos.', 'Conservar frutos en heladera. Algunos maduran mejor fuera del árbol.', 'Extraer semillas de peras maduras y realizar estratificación para germinarlas.');

INSERT INTO Plantas (IdPlanta,Nombre,Foto, Descripcion, Sustrato, Riego, Luz, Temperatura, Fertilizacion, Mantenimiento, Conservacion, Semillas) VALUES
('P0001','Margarita','/static/Imagenes/imagenes_Planta/margarita.jpg', 'La margarita es una planta herbácea muy popular por sus flores blancas y su resistencia. Ideal para jardines soleados y macetas.', 'Sustrato suelto, rico en materia orgánica, bien drenado.', 'Riego moderado, dejando secar la capa superficial entre riegos.', 'Sol pleno o semisombra ligera.', 'Entre 15 y 25 °C, tolera ligeras heladas.', 'Fertilizante líquido cada 20 días durante floración.', 'Eliminar flores secas para estimular nuevas. Poda ligera ocasional.', 'Se puede mantener todo el año en climas templados.', 'Extraer semillas de flores secas o por división de matas.'),
('P0002','Rosas','/static/Imagenes/imagenes_Planta/rosas.jpg', 'Las rosas son arbustos florales muy valorados por su aroma, color y variedad. Requieren algo más de cuidados que otras especies.', 'Sustrato fértil, profundo, bien drenado. Enriquecido con compost.', 'Riego abundante en épocas cálidas, evitando encharcamientos.', 'Sol pleno al menos 6 horas diarias.', 'Prefiere climas templados. No tolera extremos prolongados.', 'Fertilizante especial para rosas, cada 15-20 días en época activa.', 'Podas anuales para renovar ramas. Retirar flores marchitas.', 'Pueden mantenerse por años con buenos cuidados.', 'Se reproducen por esquejes o semillas de escaramujos.'),
('P0003','Potus','/static/Imagenes/imagenes_Planta/potus.jpg', 'El potus es una planta trepadora muy popular para interiores, por su resistencia y facilidad de cultivo.', 'Sustrato liviano, con mezcla de tierra negra, perlita y compost.', 'Riego moderado, más frecuente en verano. Evitar encharcar.', 'Luz indirecta brillante. Tolera baja luz.', 'Entre 18 y 28 °C. No tolera frío intenso.', 'Fertilización mensual con abono líquido balanceado.', 'Cortar tallos para dar forma y estimular ramificación.', 'Puede vivir por años en interiores con poca atención.', 'Reproducción por esquejes en agua o tierra.'),
('P0004','Cactus','/static/Imagenes/imagenes_Planta/cactus.jpg', 'Planta suculenta que almacena agua, ideal para climas secos. Hay muchas especies y formas, decorativas y fáciles de cuidar.', 'Sustrato arenoso con excelente drenaje. Ideal mezcla para cactus.', 'Riego muy espaciado. Dejar secar completamente entre riegos.', 'Sol pleno o luz indirecta intensa.', 'Prefiere temperaturas cálidas. Tolera sequías y calor.', 'Fertilizar solo en primavera/verano con abono bajo en nitrógeno.', 'Evitar humedad alta. Limpiar espinas si se ensucian.', 'Muy longevos. Pueden vivir décadas con pocos cuidados.', 'Reproducción por hijuelos o semillas según la especie.'),
('P0005','Tradescantia','/static/Imagenes/imagenes_Planta/tradescantia.jpg', 'Planta de interior o exterior en sombra. Con hojas vistosas y fácil propagación, es muy usada en decoración.', 'Sustrato universal con buen drenaje, mezcla con compost o perlita.', 'Riego frecuente pero moderado. No dejar secar completamente.', 'Luz brillante indirecta. Tolera algo de sombra.', 'Temperaturas entre 15 y 28 °C. No resiste heladas.', 'Abono líquido mensual en primavera-verano.', 'Podas regulares para mantener forma y estimular densidad.', 'Ideal como colgante. Crecimiento rápido.', 'Fácil de reproducir por esquejes en agua o tierra.');

INSERT INTO CiclosPlantas VALUES
('V0000', '123', 'Variable', 'Las semillas reposan en espera de calor y humedad.', 'Fuera del cultivo'),
('V0000', '124', '1 día', 'Se siembran semillas en suelo fértil y profundo.', 'Primavera'),
('V0000', '125', '7 a 10 días', 'Germina con rapidez si hay humedad y temperatura.', 'Primavera'),
('V0000', '126', '2 a 3 semanas', 'Desarrollo de hojas grandes y tallos rastreros.', 'Primavera a verano'),
('V0000', '127', '1 semana', 'Florecen flores grandes para ser polinizadas.', 'Verano'),
('V0000', '128', '40 a 60 días', 'Los frutos se desarrollan hasta alcanzar gran tamaño.', 'Verano a otoño'),
('V0000', '129', '1 día', 'Se cosecha cuando la cáscara está dura y el tallo seco.', 'Otoño');

INSERT INTO CiclosPlantas VALUES
('V0001', '123', 'Variable', 'La semilla se mantiene en reposo hasta condiciones ideales.', 'Fuera del cultivo'),
('V0001', '124', '1 día', 'Se siembran las semillas con riego y sombra ligera.', 'Primavera'),
('V0001', '125', '5 a 8 días', 'Germina rápidamente en suelo húmedo y fresco.', 'Primavera'),
('V0001', '126', '2 semanas', 'Crecen hojas tiernas y se forman pequeñas rosetas.', 'Primavera a verano'),
('V0001', '127', '1 semana', 'Puede florecer si no se cosecha a tiempo.', 'Verano'),
('V0001', '128', '30 días', 'Desarrollo de semillas si se deja espigar.', 'Verano a otoño'),
('V0001', '129', '1 día', 'Se cosechan las hojas antes de que se endurezcan.', 'Primavera');

INSERT INTO CiclosPlantas VALUES
('V0002', '123', 'Variable', 'Los brotes del tubérculo esperan humedad y calor.', 'Fuera del cultivo'),
('V0002', '124', '1 día', 'Se plantan trozos con ojos en suelo profundo.', 'Primavera'),
('V0002', '125', '10 días', 'Emergen tallos tras absorber humedad.', 'Primavera'),
('V0002', '126', '3 semanas', 'Crecimiento de tallos y raíces. Se aporca.', 'Primavera a verano'),
('V0002', '127', '2 semanas', 'Puede generar flores según variedad.', 'Verano'),
('V0002', '128', '40 días', 'Engrosan los tubérculos bajo tierra.', 'Verano a otoño'),
('V0002', '129', '1 día', 'Cosecha cuando las hojas amarillean.', 'Otoño');

INSERT INTO CiclosPlantas VALUES
('V0003', '123', 'Variable', 'La semilla espera en suelo húmedo para brotar.', 'Fuera del cultivo'),
('V0003', '124', '1 día', 'Se siembran a poca profundidad con compost.', 'Primavera'),
('V0003', '125', '5 a 10 días', 'Brota tallo y raíz rápidamente.', 'Primavera'),
('V0003', '126', '2 a 3 semanas', 'Crecimiento de hojas y raíz engrosándose.', 'Primavera a verano'),
('V0003', '127', '1 semana', 'Floración discreta si no se cosecha.', 'Verano'),
('V0003', '128', '30 días', 'La raíz crece hasta alcanzar tamaño ideal.', 'Verano a otoño'),
('V0003', '129', '1 día', 'Cosecha antes de que se ponga fibrosa.', 'Otoño');

INSERT INTO CiclosPlantas VALUES
('V0004', '123', 'Variable', 'Las semillas esperan temperatura y humedad.', 'Fuera del cultivo'),
('V0004', '124', '1 día', 'Se siembra en surcos con suelo suelto.', 'Primavera'),
('V0004', '125', '10 días', 'Germina lentamente si el suelo está húmedo.', 'Primavera'),
('V0004', '126', '3 semanas', 'Desarrollo del follaje y raíz principal.', 'Primavera a verano'),
('V0004', '127', '1 semana', 'Puede florecer si no se cosecha a tiempo.', 'Verano'),
('V0004', '128', '30 a 40 días', 'Raíz engorda bajo tierra.', 'Verano a otoño'),
('V0004', '129', '1 día', 'Se extraen las raíces maduras.', 'Otoño');

INSERT INTO CiclosPlantas VALUES
('V0005', '123', 'Variable', 'Las semillas reposan hasta encontrar calor y humedad.', 'Fuera del cultivo'),
('V0005', '124', '1 día', 'Se siembran a poca profundidad en suelo húmedo.', 'Primavera'),
('V0005', '125', '7 días', 'La semilla brota rápidamente si hay calor.', 'Primavera'),
('V0005', '126', '2 semanas', 'Crecen los tallos trepadores y primeras hojas.', 'Primavera a verano'),
('V0005', '127', '1 semana', 'Aparecen flores amarillas para polinización.', 'Verano'),
('V0005', '128', '30 días', 'Desarrolla frutos largos y verdes.', 'Verano a otoño'),
('V0005', '129', '1 día', 'Se cosechan antes de que maduren en exceso.', 'Verano');

INSERT INTO CiclosPlantas VALUES
('V0006', '123', 'Variable', 'Las semillas esperan suelo cálido para germinar.', 'Fuera del cultivo'),
('V0006', '124', '1 día', 'Se siembran en hoyos profundos con compost.', 'Primavera'),
('V0006', '125', '8 días', 'Brota con rapidez en ambientes cálidos.', 'Primavera'),
('V0006', '126', '3 semanas', 'Crecen tallos rastreros y hojas grandes.', 'Primavera a verano'),
('V0006', '127', '2 semanas', 'Florecen flores grandes para polinización.', 'Verano'),
('V0006', '128', '40 días', 'Desarrolla frutos grandes de cáscara dura.', 'Verano a otoño'),
('V0006', '129', '1 día', 'Se cosechan cuando la cáscara está dura.', 'Otoño');

INSERT INTO CiclosPlantas VALUES
('V0007', '123', 'Variable', 'Las semillas esperan temperatura alta para germinar.', 'Fuera del cultivo'),
('V0007', '124', '1 día', 'Se colocan en semilleros o directo en suelo cálido.', 'Primavera'),
('V0007', '125', '7 a 10 días', 'Germina si se mantiene temperatura y humedad.', 'Primavera'),
('V0007', '126', '3 semanas', 'Desarrolla hojas anchas y tallos fuertes.', 'Primavera a verano'),
('V0007', '127', '2 semanas', 'Florecen flores lilas, clave para el fruto.', 'Verano'),
('V0007', '128', '30 a 40 días', 'El fruto se forma tras la floración.', 'Verano a otoño'),
('V0007', '129', '1 día', 'Cosecha cuando el fruto esté firme y brillante.', 'Otoño');

INSERT INTO CiclosPlantas VALUES
('V0008', '123', 'Variable', 'El bulbo espera condiciones frescas para brotar.', 'Fuera del cultivo'),
('V0008', '124', '1 día', 'Se plantan semillas o bulbillos en surcos.', 'Primavera'),
('V0008', '125', '7 días', 'Brota el tallo verde desde el bulbo.', 'Primavera'),
('V0008', '126', '2 a 3 semanas', 'Se desarrolla el follaje mientras engrosa el bulbo.', 'Primavera a verano'),
('V0008', '127', '1 semana', 'Puede florecer si se deja sin cosecha.', 'Verano'),
('V0008', '128', '40 días', 'El bulbo se forma y madura.', 'Verano a otoño'),
('V0008', '129', '1 día', 'Cosecha cuando el follaje se seca.', 'Otoño');

INSERT INTO CiclosPlantas VALUES
('V0009', '123', 'Variable', 'Los dientes reposan hasta condiciones ideales.', 'Fuera del cultivo'),
('V0009', '124', '1 día', 'Se plantan dientes individuales en suelo suelto.', 'Primavera'),
('V0009', '125', '10 días', 'Germina desde el diente enterrado.', 'Primavera'),
('V0009', '126', '3 semanas', 'Crecen hojas y se desarrollan nuevos bulbos.', 'Primavera a verano'),
('V0009', '127', '1 semana', 'Puede generar flor si no se cosecha a tiempo.', 'Verano'),
('V0009', '128', '30 a 40 días', 'El bulbo se forma por división interna.', 'Verano a otoño'),
('V0009', '129', '1 día', 'Se cosecha cuando el follaje se seca.', 'Otoño');

INSERT INTO CiclosPlantas VALUES
('V0010', '123', 'Variable', 'Las semillas reposan hasta temperatura óptima.', 'Fuera del cultivo'),
('V0010', '124', '1 día', 'Se siembran en semilleros o macetas.', 'Primavera'),
('V0010', '125', '8 a 10 días', 'Germina si hay humedad y calor.', 'Primavera'),
('V0010', '126', '2 semanas', 'Crecen hojas anchas y tallos gruesos.', 'Primavera a verano'),
('V0010', '127', '2 semanas', 'Aparecen flores blancas para formar frutos.', 'Verano'),
('V0010', '128', '30 a 40 días', 'Desarrolla frutos de colores intensos.', 'Verano a otoño'),
('V0010', '129', '1 día', 'Cosecha cuando el fruto está completamente maduro.', 'Otoño');

INSERT INTO CiclosPlantas VALUES
('F0001', '123', 'Variable', 'Semillas o estolones reposan hasta condiciones favorables.', 'Fuera del cultivo'),
('F0001', '124', '1 semana', 'Se plantan estolones o semillas en sustrato húmedo.', 'Primavera'),
('F0001', '125', '7 a 14 días', 'Germinación o enraizamiento de estolones.', 'Primavera'),
('F0001', '126', '2 a 3 semanas', 'Desarrollo de hojas y raíces activas.', 'Primavera a verano'),
('F0001', '127', '1 semana', 'Aparecen flores blancas listas para polinización.', 'Verano'),
('F0001', '128', '15 a 30 días', 'Frutos se desarrollan y maduran lentamente.', 'Verano'),
('F0001', '129', '1 día', 'Cosechar frutos rojos maduros con cuidado.', 'Verano a otoño');

INSERT INTO CiclosPlantas VALUES
('F0002', '123', 'Meses', 'La semilla reposa en espera de calor y humedad.', 'Fuera del cultivo'),
('F0002', '124', '1 semana', 'Se planta la semilla o se injerta en sustrato fértil.', 'Primavera'),
('F0002', '125', '2 a 4 semanas', 'Brotan tallos finos y primeras hojas.', 'Primavera'),
('F0002', '126', 'Meses', 'Crecimiento del árbol con ramas y follaje.', 'Primavera a verano'),
('F0002', '127', '1 mes', 'Flores blancas fragantes listas para fructificar.', 'Primavera'),
('F0002', '128', '6 a 8 meses', 'Fruto crece y madura en la planta.', 'Verano a otoño'),
('F0002', '129', '1 día', 'Se cosechan frutos maduros, firmes y aromáticos.', 'Otoño a invierno');

INSERT INTO CiclosPlantas VALUES
('F0003', '123', 'Variable', 'La semilla permanece en reposo hasta el cultivo.', 'Fuera del cultivo'),
('F0003', '124', '1 semana', 'Se siembran semillas o se injerta sobre patrón.', 'Primavera'),
('F0003', '125', '2 a 3 semanas', 'Brotan tallos delgados con primeras hojas.', 'Primavera'),
('F0003', '126', 'Meses', 'El árbol crece lentamente y se fortalece.', 'Primavera a verano'),
('F0003', '127', '3 semanas', 'Floración abundante con flores blancas.', 'Primavera a verano'),
('F0003', '128', '6 a 9 meses', 'El fruto crece desde verde hasta madurez amarilla.', 'Verano a otoño'),
('F0003', '129', '1 día', 'Cosechar cuando el fruto está firme y fragante.', 'Todo el año');

INSERT INTO CiclosPlantas VALUES
('F0004', '123', 'Meses', 'La semilla entra en reposo y requiere frío.', 'Invierno'),
('F0004', '124', '1 semana', 'Se planta semilla estratificada o se injerta.', 'Primavera'),
('F0004', '125', '2 a 4 semanas', 'Comienzan a brotar hojas tras la estratificación.', 'Primavera'),
('F0004', '126', 'Meses', 'El árbol crece lentamente y forma copa.', 'Primavera a verano'),
('F0004', '127', '1 mes', 'Aparecen flores blancas o rosadas para polinización.', 'Primavera'),
('F0004', '128', '5 a 6 meses', 'El fruto se desarrolla y gana color y tamaño.', 'Verano a otoño'),
('F0004', '129', '1 día', 'Cosechar cuando el fruto está maduro y firme.', 'Otoño');

INSERT INTO CiclosPlantas VALUES
('F0005', '123', 'Meses', 'La semilla descansa hasta condiciones óptimas.', 'Fuera del cultivo'),
('F0005', '124', '1 semana', 'Se planta la semilla o se realiza injerto.', 'Primavera'),
('F0005', '125', '2 a 3 semanas', 'Surgen brotes y hojas nuevas.', 'Primavera'),
('F0005', '126', 'Meses', 'Crecimiento de tronco y ramas del árbol.', 'Primavera a verano'),
('F0005', '127', '2 a 3 semanas', 'Floración con pétalos blancos y aroma cítrico.', 'Primavera'),
('F0005', '128', '6 a 9 meses', 'Fruto se forma y madura lentamente.', 'Verano a otoño'),
('F0005', '129', '1 día', 'Cosechar naranjas cuando estén firmes y coloridas.', 'Otoño a invierno');

INSERT INTO CiclosPlantas VALUES
('F0006', '123', 'Meses', 'La semilla necesita reposar y frío para germinar.', 'Invierno'),
('F0006', '124', '1 semana', 'Se planta semilla estratificada o injerto.', 'Primavera'),
('F0006', '125', '2 a 4 semanas', 'Comienza a crecer con brotes y hojas.', 'Primavera'),
('F0006', '126', 'Meses', 'Desarrollo de ramas y estructura del árbol.', 'Primavera a verano'),
('F0006', '127', '1 mes', 'Aparecen flores blancas, atractivas para insectos.', 'Primavera'),
('F0006', '128', '4 a 6 meses', 'Los frutos se agrandan y adquieren aroma.', 'Verano a otoño'),
('F0006', '129', '1 día', 'Cosechar cuando la pera esté madura pero firme.', 'Otoño');

INSERT INTO CiclosPlantas VALUES
('P0001', '123', '1 a 2 meses', 'Periodo de reposo donde la planta conserva energía.', 'Invierno'),
('P0001', '124', '1 semana', 'Siembra de semillas en sustrato bien drenado y luz moderada.', 'Primavera'),
('P0001', '125', '2 a 3 semanas', 'Germinación de semillas, primeras hojas aparecen.', 'Primavera'),
('P0001', '126', '2 a 3 meses', 'Crecimiento vegetativo activo con buen riego y sol parcial.', 'Primavera a verano'),
('P0001', '127', '1 a 2 meses', 'Floración abundante, flores blancas visibles.', 'Verano'),
('P0001', '128', 'No aplica', 'Las margaritas no fructifican de forma destacada.', 'N/A'),
('P0001', '129', '1 semana', 'Cosecha de flores para decoración o secado.', 'Verano');

INSERT INTO CiclosPlantas VALUES
('P0002', '123', '2 meses', 'Reposo invernal, poda para preparar nueva brotación.', 'Invierno'),
('P0002', '124', '2 semanas', 'Siembra o trasplante de esquejes o semillas.', 'Primavera'),
('P0002', '125', '3 semanas', 'Germinación y primeros brotes verdes.', 'Primavera'),
('P0002', '126', '3 meses', 'Crecimiento vegetativo fuerte, hojas y tallos vigorosos.', 'Primavera a verano'),
('P0002', '127', '2 meses', 'Floración con rosas en diferentes colores.', 'Verano'),
('P0002', '128', '1 mes', 'Fructificación con formación de escaramujos.', 'Finales de verano a otoño'),
('P0002', '129', '1 semana', 'Cosecha de rosas para flor cortada o producción de semillas.', 'Otoño');

INSERT INTO CiclosPlantas VALUES
('P0003', '123', 'No aplica', 'El potus no tiene un reposo marcado.', 'N/A'),
('P0003', '124', 'No se siembra, usualmente esquejes.', 'Siembra por esquejes en agua o tierra.', 'Todo el año'),
('P0003', '125', '2 a 3 semanas', 'Enraizamiento de esquejes y brotación.', 'Primavera a verano'),
('P0003', '126', 'Meses', 'Crecimiento vegetativo rápido en ambientes con luz indirecta.', 'Primavera a otoño'),
('P0003', '127', 'No florece comúnmente', 'Floración rara y poco significativa.', 'N/A'),
('P0003', '128', 'No fructifica', 'No produce frutos.', 'N/A'),
('P0003', '129', 'No aplica', 'No se realiza cosecha.', 'N/A');

INSERT INTO CiclosPlantas VALUES
('P0004', '123', '3 a 4 meses', 'Reposo durante temporadas frías o secas.', 'Invierno'),
('P0004', '124', '2 semanas', 'Siembra de semillas o colocación de hijuelos.', 'Primavera'),
('P0004', '125', '3 a 6 semanas', 'Germinación lenta bajo condiciones controladas.', 'Primavera'),
('P0004', '126', 'Meses a años', 'Crecimiento muy lento, acumulación de tejido.', 'Primavera a verano'),
('P0004', '127', '1 mes', 'Floración breve y vistosa, dependiendo de la especie.', 'Verano'),
('P0004', '128', 'No siempre fructifica', 'En algunas especies se desarrollan frutos pequeños.', 'Verano a otoño'),
('P0004', '129', '1 día', 'Cosecha de semillas o hijuelos para reproducción.', 'Otoño');

INSERT INTO CiclosPlantas VALUES
('P0005', '123', 'No marcado', 'Reposo leve en condiciones adversas.', 'Invierno'),
('P0005', '124', 'No suele sembrarse por semilla', 'Propagación por esquejes muy frecuente.', 'Todo el año'),
('P0005', '125', '2 semanas', 'Enraizamiento y brotación de esquejes.', 'Primavera'),
('P0005', '126', 'Meses', 'Crecimiento vegetativo rápido y denso.', 'Primavera a verano'),
('P0005', '127', 'Floración poco relevante', 'Floración mínima o decorativa.', 'N/A'),
('P0005', '128', 'No fructifica', 'No produce frutos.', 'N/A'),
('P0005', '129', 'No aplica', 'No hay cosecha de frutos.', 'N/A');