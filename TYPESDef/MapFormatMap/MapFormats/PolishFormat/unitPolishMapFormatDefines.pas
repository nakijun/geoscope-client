unit unitPolishMapFormatDefines;
Interface
Uses
  SysUtils,
  Classes,
  StrUtils;

type
  TPMFObjectKind = (
    pmfokUnknown = 0,
    pmfokPolyline = 1,
    pmfokPolygon = 2,
    pmfokPOI = 3
  );

  TPFMObjectTypeDescriptor = record
    TypeID: integer;
    TypeName: string;
  end;

const
  PMFObjectKindStrings: array[TPMFObjectKind] of string = (
    'Unknown',
    'POLYLINE',
    'POLYGON',
    'POI (Point Of Interest)'
  );

const
  PMFHeaderDescriptor = '[IMG ID]';
  PMFHeaderEndDescriptor = '[END-IMG ID]';
  //.
  PMFPointDescriptor = '[POI]';
  PMFPointDescriptor1 = '[RGN10]';
  PMFPointEndDescriptor = '[END';
  PMFPointSection = 'POI';
  //.
  PMFPolylineDescriptor = '[POLYLINE]';
  PMFPolylineDescriptor1 = '[RGN40]';
  PMFPolylineEndDescriptor = '[END';
  PMFPolylineSection = 'POLYLINE';
  //.
  PMFPolygonDescriptor = '[POLYGON]';
  PMFPolygonDescriptor1 = '[RGN80]';
  PMFPolygonEndDescriptor = '[END';
  PMFPolygonSection = 'POLYGON';

const
  POLYLINE_TYPES: array[0..39] of TPFMObjectTypeDescriptor = (
    (TypeID: $0;  TypeName: 'Дорога'),
    (TypeID: $01; TypeName: 'Автомагистраль'),
    (TypeID: $02; TypeName: 'Шоссе основное'),
    (TypeID: $03; TypeName: 'Прочие загородные дороги'),
    (TypeID: $04; TypeName: 'Городская магистраль'),
    (TypeID: $05; TypeName: 'Улица крупная'),
    (TypeID: $06; TypeName: 'Улица малая'),
    (TypeID: $07; TypeName: 'Переулок, внутриквартальный проезд'),
    (TypeID: $08; TypeName: 'Наклонный съезд с путепровода'),
    (TypeID: $09; TypeName: 'Наклонный съезд с путепровода скоростной'),
    (TypeID: $0a; TypeName: 'Проселочная дорога'),
    (TypeID: $0b; TypeName: 'Развязка дорог'),
    (TypeID: $0c; TypeName: 'Круговое движение'),
    (TypeID: $14; TypeName: 'Железная дорога'),
    (TypeID: $15; TypeName: 'Береговая линия'),
    (TypeID: $16; TypeName: 'Аллея, тропа'),
    (TypeID: $18; TypeName: 'Ручей'),
    (TypeID: $19; TypeName: 'Граница часового пояса'),
    (TypeID: $1a; TypeName: 'Паром'),
    (TypeID: $1b; TypeName: 'Паром'),
    (TypeID: $1c; TypeName: 'Граница области'),
    (TypeID: $1d; TypeName: 'Граница района, округа'),
    (TypeID: $1e; TypeName: 'Международная граница'),
    (TypeID: $1f; TypeName: 'Река'),
    (TypeID: $20; TypeName: 'Горизонталь вспомогательная'),
    (TypeID: $21; TypeName: 'Горизонталь основная'),
    (TypeID: $22; TypeName: 'Горизонталь утолщённая'),
    (TypeID: $23; TypeName: 'Изобата вспомогательная'),
    (TypeID: $24; TypeName: 'Изобата основная'),
    (TypeID: $25; TypeName: 'Изобата утолщённая'),
    (TypeID: $26; TypeName: 'Пересыхающая река, ручей'),
    (TypeID: $27; TypeName: 'Взлетно-посадочная полоса'),
    (TypeID: $28; TypeName: 'Трубопровод'),
    (TypeID: $29; TypeName: 'Линия электропередачи'),
    (TypeID: $2a; TypeName: 'Морская граница'),
    (TypeID: $2b; TypeName: 'Морская опасность'),
    (TypeID: $41; TypeName: 'Троллейбусный маршрут'),
    (TypeID: $42; TypeName: 'Грунтовая дорога'),
    (TypeID: $44; TypeName: 'Крупная река'),
    (TypeID: $45; TypeName: 'Граница нас. пункта')
  );

  function POLYLINE_TYPES_GetNameByID(const TypeID: integer): string;

const
  POLYGON_TYPES: array[0..59] of TPFMObjectTypeDescriptor = (
    (TypeID: $01; TypeName: 'Городская застройка (>200т.ж.) (полигон прозрачен)'),
    (TypeID: $02; TypeName: 'Городская застройка (<200т.ж.) (полигон прозрачен)'),
    (TypeID: $03; TypeName: 'Застройка сельского типа (полигон прозрачен)'),
    (TypeID: $4a; TypeName: 'Область определения карты (полигон прозрачен)'),
    (TypeID: $4b; TypeName: 'Фон карты (полигон прозрачен)'),
    (TypeID: $04; TypeName: 'Военная база'),
    (TypeID: $05; TypeName: 'Автостоянка'),
    (TypeID: $06; TypeName: 'Гаражи'),
    (TypeID: $07; TypeName: 'Аэропорт'),
    (TypeID: $08; TypeName: 'Место для торговли'),
    (TypeID: $09; TypeName: 'Пристань'),
    (TypeID: $0a; TypeName: 'Территория университета или колледжа'),
    (TypeID: $0b; TypeName: 'Больница'),
    (TypeID: $0c; TypeName: 'Промышленная зона'),
    (TypeID: $0d; TypeName: 'Резервация, заповедник'),
    (TypeID: $0e; TypeName: 'Взлетно-посадочная полоса'),
    (TypeID: $13; TypeName: 'Здания, искусственные сооружения'),
    (TypeID: $53; TypeName: 'Отмель'),
    (TypeID: $52; TypeName: 'Тундра'),
    (TypeID: $4c; TypeName: 'Пересыхающая река или озеро'),
    (TypeID: $14; TypeName: 'Национальный парк'),
    (TypeID: $15; TypeName: 'Национальный парк'),
    (TypeID: $16; TypeName: 'Национальный парк'),
    (TypeID: $17; TypeName: 'Городской парк'),
    (TypeID: $18; TypeName: 'Поле для гольфа'),
    (TypeID: $19; TypeName: 'Спортивный комплекс'),
    (TypeID: $1a; TypeName: 'Кладбище'),
    (TypeID: $1e; TypeName: 'Государственный парк'),
    (TypeID: $1f; TypeName: 'Государственный парк'),
    (TypeID: $20; TypeName: 'Государственный парк'),
    (TypeID: $4d; TypeName: 'Ледник'),
    (TypeID: $28; TypeName: 'Море, океан'),
    (TypeID: $29; TypeName: 'Водоем'),
    (TypeID: $32; TypeName: 'Море'),
    (TypeID: $3b; TypeName: 'Водоем'),
    (TypeID: $3c; TypeName: 'Озеро большое (250-600кв.км.)'),
    (TypeID: $3d; TypeName: 'Озеро большое (77-250кв.км.)'),
    (TypeID: $3e; TypeName: 'Озеро среднее (25-77кв.км.)'),
    (TypeID: $3f; TypeName: 'Озеро среднее (11-25кв.км.)'),
    (TypeID: $40; TypeName: 'Озеро малое  (0,25-11кв.км.)'),
    (TypeID: $41; TypeName: 'Озеро малое  (<0,25кв.км.)'),
    (TypeID: $42; TypeName: 'Озеро крупное (>3300кв.км.)'),
    (TypeID: $43; TypeName: 'Озеро крупное (1100-3300кв.км.)'),
    (TypeID: $44; TypeName: 'Озеро большое (600-1100кв.км.)'),
    (TypeID: $45; TypeName: 'Водоем'),
    (TypeID: $46; TypeName: 'Река крупная (>1000м)'),
    (TypeID: $47; TypeName: 'Река большая (200-1000м)'),
    (TypeID: $48; TypeName: 'Река средняя (40-200м)'),
    (TypeID: $49; TypeName: 'Река малая (<40м)'),
    (TypeID: $4e; TypeName: 'Фруктовый сад или огород'),
    (TypeID: $50; TypeName: 'Лес'),
    (TypeID: $4f; TypeName: 'Кустарник'),
    (TypeID: $51; TypeName: 'Болото'),
    (TypeID: $6a; TypeName: 'Квадрат'),
    (TypeID: $6c; TypeName: 'Дом'),
    (TypeID: $80; TypeName: 'Зона текста'),
    (TypeID: $82; TypeName: 'Низкорослый лес'),
    (TypeID: $83; TypeName: 'Редкий лес'),
    (TypeID: $85; TypeName: 'Вырубленный лес/пеньки'),
    (TypeID: $8b; TypeName: 'Засоленные почвы/солевое болото')
  );

  function POLYGON_TYPES_GetNameByID(const TypeID: integer): string;

const
  POI_TYPES: array[0..270] of TPFMObjectTypeDescriptor = (
    (TypeID: $100;  TypeName: 'Мегаполис (свыше 10 млн.)'),
    (TypeID: $200;  TypeName: 'Мегаполис (5-10 млн.)'),
    (TypeID: $300;  TypeName: 'Крупный город (2-5 млн.)'),
    (TypeID: $400;  TypeName: 'Крупный город (1-2 млн.)'),
    (TypeID: $500;  TypeName: 'Крупный город (0.5-1 млн.)'),
    (TypeID: $600;  TypeName: 'Город (200-500 тыс.)'),
    (TypeID: $700;  TypeName: 'Город (100-200 тыс.)'),
    (TypeID: $800;  TypeName: 'Город (50-100 тыс.)'),
    (TypeID: $900;  TypeName: 'Город (20-50 тыс.)'),
    (TypeID: $a00;  TypeName: 'Населенный пункт (10-20 тыс.)'),
    (TypeID: $b00;  TypeName: 'Населенный пункт (4-10 тыс.)'),
    (TypeID: $c00;  TypeName: 'Населенный пункт (2-4 тыс.)'),
    (TypeID: $d00;  TypeName: 'Населенный пункт (1-2 тыс.)'),
    (TypeID: $e00;  TypeName: 'Поселок (500-1000)'),
    (TypeID: $f00;  TypeName: 'Поселок (200-500)'),
    (TypeID: $1000; TypeName: 'Поселок (100-200)'),
    (TypeID: $1100; TypeName: 'Поселок (менее 100)'),
    (TypeID: $1400; TypeName: 'Название крупного государства'),
    (TypeID: $1500; TypeName: 'Название малого государства'),
    (TypeID: $1e00; TypeName: 'Название области, провинции, штата'),
    (TypeID: $1f00; TypeName: 'Название района, округа'),
    (TypeID: $2800; TypeName: 'Надпись'),
    (TypeID: $1600; TypeName: 'Маяк'),
    (TypeID: $1601; TypeName: 'Туманный ревун'),
    (TypeID: $1602; TypeName: 'Радиомаяк'),
    (TypeID: $1603; TypeName: 'Радиобуй'),
    (TypeID: $1604; TypeName: 'Дневной маяк (красный треугольник)'),
    (TypeID: $1605; TypeName: 'Дневной маяк (зеленый квадрат)'),
    (TypeID: $1606; TypeName: 'Дневной маяк (белый ромб)'),
    (TypeID: $1607; TypeName: 'Несветящийся маяк белый'),
    (TypeID: $1608; TypeName: 'Несветящийся маяк красный'),
    (TypeID: $1609; TypeName: 'Несветящийся маяк зеленый'),
    (TypeID: $160a; TypeName: 'Несветящийся маяк черный'),
    (TypeID: $160b; TypeName: 'Несветящийся маяк желтый'),
    (TypeID: $160c; TypeName: 'Несветящийся маяк оранжевый'),
    (TypeID: $160d; TypeName: 'Несветящийся маяк многоцветный'),
    (TypeID: $160e; TypeName: 'Светящийся маяк'),
    (TypeID: $160f; TypeName: 'Светящийся маяк белый'),
    (TypeID: $1610; TypeName: 'Светящийся маяк красный'),
    (TypeID: $1611; TypeName: 'Светящийся маяк зеленый'),
    (TypeID: $1612; TypeName: 'Светящийся маяк желтый'),
    (TypeID: $1613; TypeName: 'Светящийся маяк оранжевый'),
    (TypeID: $1614; TypeName: 'Светящийся маяк фиолетовый'),
    (TypeID: $1615; TypeName: 'Светящийся маяк синий'),
    (TypeID: $1616; TypeName: 'Светящийся маяк многоцветный'),
    (TypeID: $1c00; TypeName: 'Водная преграда'),
    (TypeID: $1c01; TypeName: 'Обломки кораблекрушения'),
    (TypeID: $1c02; TypeName: 'Затопленные обломки, опасные'),
    (TypeID: $1c03; TypeName: 'Затопленные обломки, не опасные'),
    (TypeID: $1c04; TypeName: 'Обломки, очищенные драгой'),
    (TypeID: $1c05; TypeName: 'Преграда, видимая при высокой воде'),
    (TypeID: $1c06; TypeName: 'Преграда на уровне воды'),
    (TypeID: $1c07; TypeName: 'Преграда ниже уровня воды'),
    (TypeID: $1c08; TypeName: 'Преграда, очищенная драгой'),
    (TypeID: $1c09; TypeName: 'Рифы на уровне воды'),
    (TypeID: $1c0a; TypeName: 'Подводные рифы'),
    (TypeID: $1c0b; TypeName: 'Отметка глубины'),
    (TypeID: $1d00; TypeName: 'Расписание приливов'),
    (TypeID: $2000; TypeName: 'Съезд с шоссе'),
    (TypeID: $2100; TypeName: 'Съезд с шоссе с инфраструктурой'),
    (TypeID: $210F; TypeName: 'Съезд к сервису'),
    (TypeID: $2110; TypeName: 'Съезд к техобслуживанию'),
    (TypeID: $2200; TypeName: 'Съезд к туалету'),
    (TypeID: $2300; TypeName: 'Съезд к магазину'),
    (TypeID: $2400; TypeName: 'Съезд к весовой станции'),
    (TypeID: $2500; TypeName: 'Съезд платный'),
    (TypeID: $2600; TypeName: 'Съезд к справочной'),
    (TypeID: $2700; TypeName: 'Съезд с шоссе'),
    (TypeID: $2a00; TypeName: 'Предприятие питания'),
    (TypeID: $2a01; TypeName: 'Ресторан (американская кухня)'),
    (TypeID: $2a02; TypeName: 'Ресторан (азиатская кухня)'),
    (TypeID: $2a03; TypeName: 'Ресторан (шашлык)'),
    (TypeID: $2a04; TypeName: 'Ресторан (китайская кухня)'),
    (TypeID: $2a05; TypeName: 'Ресторан (деликатесы, торты, пирожные)'),
    (TypeID: $2a06; TypeName: 'Ресторан (интернациональная кухня)'),
    (TypeID: $2a07; TypeName: 'Ресторан быстрого питания'),
    (TypeID: $2a08; TypeName: 'Ресторан (итальянская кухня)'),
    (TypeID: $2a09; TypeName: 'Ресторан (мексиканская кухня)'),
    (TypeID: $2a0a; TypeName: 'Пиццерия'),
    (TypeID: $2a0b; TypeName: 'Ресторан (морепродукты)'),
    (TypeID: $2a0c; TypeName: 'Ресторан (гриль)'),
    (TypeID: $2a0d; TypeName: 'Общепит (кондитерские изделия)'),
    (TypeID: $2a0e; TypeName: 'Кафе'),
    (TypeID: $2a0f; TypeName: 'Ресторан (французская кухня)'),
    (TypeID: $2a10; TypeName: 'Ресторан (немецкая кухня)'),
    (TypeID: $2a11; TypeName: 'Ресторан (британская островная кухня)'),
    (TypeID: $2a11; TypeName: 'Ресторан (британская островная кухня)'),
    (TypeID: $2a12; TypeName: 'Специальные пищевые продукты'),
    (TypeID: $2900; TypeName: 'Прочие услуги'),
    (TypeID: $2b00; TypeName: 'Гостиница'),
    (TypeID: $2b01; TypeName: 'Отель или мотель'),
    (TypeID: $2b02; TypeName: 'Отель с завтраком'),
    (TypeID: $2b03; TypeName: 'Кемпинг'),
    (TypeID: $2b04; TypeName: 'Курортный отель'),
    (TypeID: $2c00; TypeName: 'Объект культуры, досуга'),
    (TypeID: $2c01; TypeName: 'ПКиО'),
    (TypeID: $2c02; TypeName: 'Музей'),
    (TypeID: $2c03; TypeName: 'Библиотека'),
    (TypeID: $2c04; TypeName: 'Достопримечательность'),
    (TypeID: $2c05; TypeName: 'Школа'),
    (TypeID: $2c06; TypeName: 'Парк/Сад'),
    (TypeID: $2c07; TypeName: 'Зоопарк/Аквариум'),
    (TypeID: $2c08; TypeName: 'Стадион'),
    (TypeID: $2c09; TypeName: 'Зал'),
    (TypeID: $2c0a; TypeName: 'Винный ресторан'),
    (TypeID: $2c0b; TypeName: 'Храм/Мечеть/Синагога'),
    (TypeID: $2d00; TypeName: 'Развлекательное заведение'),
    (TypeID: $2d01; TypeName: 'Театр'),
    (TypeID: $2d02; TypeName: 'Бар/Ночной клуб'),
    (TypeID: $2d03; TypeName: 'Кинотеатр'),
    (TypeID: $2d04; TypeName: 'Казино'),
    (TypeID: $2d05; TypeName: 'Гольф-клуб'),
    (TypeID: $2d06; TypeName: 'Лыжный центр/курорт'),
    (TypeID: $2d07; TypeName: 'Боулинг-центр'),
    (TypeID: $2d08; TypeName: 'Каток'),
    (TypeID: $2d09; TypeName: 'Бассейн'),
    (TypeID: $2d0a; TypeName: 'Спортзал/Фитнес-центр'),
    (TypeID: $2d0b; TypeName: 'Спортивный аэродром'),
    (TypeID: $2e00; TypeName: 'Торговый объект'),
    (TypeID: $2e01; TypeName: 'Универмаг'),
    (TypeID: $2e02; TypeName: 'Бакалея'),
    (TypeID: $2e03; TypeName: 'Торговая фирма'),
    (TypeID: $2e04; TypeName: 'Торговый центр'),
    (TypeID: $2e05; TypeName: 'Аптека'),
    (TypeID: $2e06; TypeName: 'Товары повседневного спроса'),
    (TypeID: $2e07; TypeName: 'Одежда'),
    (TypeID: $2e08; TypeName: 'Товары для дома и сада'),
    (TypeID: $2e09; TypeName: 'Мебель'),
    (TypeID: $2e0a; TypeName: 'Специализированный магазин'),
    (TypeID: $2e0b; TypeName: 'Компьютеры/ПО'),
    (TypeID: $2f00; TypeName: 'Услуги'),
    (TypeID: $2f01; TypeName: 'АЗС'),
    (TypeID: $2f02; TypeName: 'Аренда автомобилей'),
    (TypeID: $2f03; TypeName: 'Автосервис'),
    (TypeID: $2f04; TypeName: 'Аэровокзал'),
    (TypeID: $2f05; TypeName: 'Почтовое отделение'),
    (TypeID: $2f06; TypeName: 'Банк'),
    (TypeID: $2f07; TypeName: 'Автомагазин'),
    (TypeID: $2f08; TypeName: 'Станция/остановка наземного транспорта'),
    (TypeID: $2f09; TypeName: 'Ремонт лодок, катеров, яхт'),
    (TypeID: $2f0a; TypeName: 'Аварийная служба, техпомощь'),
    (TypeID: $2f0b; TypeName: 'Автостоянка'),
    (TypeID: $2f0c; TypeName: 'Место отдыха, информация для туристов'),
    (TypeID: $2f0d; TypeName: 'Автоклуб'),
    (TypeID: $2f0e; TypeName: 'Автомойка'),
    (TypeID: $2f0f; TypeName: 'Дилер фирмы Garmin'),
    (TypeID: $2f10; TypeName: 'Служба быта (прачечная, химчистка)'),
    (TypeID: $2f11; TypeName: 'Бизнес-сервис'),
    (TypeID: $2f12; TypeName: 'Пункт связи'),
    (TypeID: $2f13; TypeName: 'Бюро ремонта'),
    (TypeID: $2f14; TypeName: 'Собес'),
    (TypeID: $2f15; TypeName: 'Коммунальные службы'),
    (TypeID: $2f16; TypeName: 'Стоянка грузовиков'),
    (TypeID: $2f17; TypeName: 'Остановка общественного транспорта'),
    (TypeID: $3000; TypeName: 'Государственная или экстренная служба'),
    (TypeID: $3001; TypeName: 'Отделение милиции'),
    (TypeID: $3002; TypeName: 'Больница'),
    (TypeID: $3003; TypeName: 'Мэрия'),
    (TypeID: $3004; TypeName: 'Суд'),
    (TypeID: $3005; TypeName: 'Помещение для проведения общественных мероприятий'),
    (TypeID: $3006; TypeName: 'Пограничный пункт'),
    (TypeID: $3007; TypeName: 'Государственное учреждение'),
    (TypeID: $3008; TypeName: 'Пожарная часть'),
    (TypeID: $5900; TypeName: 'Аэропорт'),
    (TypeID: $5901; TypeName: 'Крупный аэропорт'),
    (TypeID: $5902; TypeName: 'Средний аэропорт'),
    (TypeID: $5903; TypeName: 'Малый аэропорт'),
    (TypeID: $5904; TypeName: 'Вертолетная площадка'),
    (TypeID: $5905; TypeName: 'Аэропорт'),
    (TypeID: $6400; TypeName: 'Искусственное сооружение'),
    (TypeID: $6401; TypeName: 'Мост'),
    (TypeID: $6402; TypeName: 'Здание'),
    (TypeID: $6403; TypeName: 'Кладбище'),
    (TypeID: $6404; TypeName: 'Храм/Мечеть/Синагога'),
    (TypeID: $6405; TypeName: 'Общественное здание'),
    (TypeID: $6406; TypeName: 'Перекресток, переправа, перевал'),
    (TypeID: $6407; TypeName: 'Плотина'),
    (TypeID: $6408; TypeName: 'Больница'),
    (TypeID: $6409; TypeName: 'Плотина, набережная'),
    (TypeID: $640a; TypeName: 'Указатель'),
    (TypeID: $640b; TypeName: 'Военный объект'),
    (TypeID: $640c; TypeName: 'Шахта, рудник'),
    (TypeID: $640d; TypeName: 'Месторождение нефти'),
    (TypeID: $640e; TypeName: 'Парк'),
    (TypeID: $640f; TypeName: 'Почта'),
    (TypeID: $6410; TypeName: 'Школа'),
    (TypeID: $6411; TypeName: 'Башня, вышка'),
    (TypeID: $6412; TypeName: 'Тропа'),
    (TypeID: $6413; TypeName: 'Тоннель'),
    (TypeID: $6414; TypeName: 'Питьевая вода, родник, колодец'),
    (TypeID: $6415; TypeName: 'Заброшенное жилье'),
    (TypeID: $6416; TypeName: 'Пристройка'),
    (TypeID: $6500; TypeName: 'Объект гидрографии'),
    (TypeID: $6501; TypeName: 'Арройо, высохшее русло'),
    (TypeID: $6502; TypeName: 'Отмель'),
    (TypeID: $6503; TypeName: 'Залив'),
    (TypeID: $6504; TypeName: 'Излучина реки'),
    (TypeID: $6505; TypeName: 'Искусственный канал'),
    (TypeID: $6506; TypeName: 'Пролив'),
    (TypeID: $6507; TypeName: 'Бухта'),
    (TypeID: $6508; TypeName: 'Водопад'),
    (TypeID: $6509; TypeName: 'Гейзер'),
    (TypeID: $650a; TypeName: 'Ледник'),
    (TypeID: $650b; TypeName: 'Гавань'),
    (TypeID: $650c; TypeName: 'Остров'),
    (TypeID: $650d; TypeName: 'Озеро'),
    (TypeID: $650e; TypeName: 'Пороги'),
    (TypeID: $650f; TypeName: 'Водохранилище'),
    (TypeID: $6510; TypeName: 'Море'),
    (TypeID: $6511; TypeName: 'Родник'),
    (TypeID: $6512; TypeName: 'Ручей'),
    (TypeID: $6513; TypeName: 'Болото'),
    (TypeID: $6600; TypeName: 'Природный наземный объект'),
    (TypeID: $6601; TypeName: 'Арка'),
    (TypeID: $6602; TypeName: 'Район, область'),
    (TypeID: $6603; TypeName: 'Котловина'),
    (TypeID: $6604; TypeName: 'Берег'),
    (TypeID: $6605; TypeName: 'Карниз, уступ'),
    (TypeID: $6606; TypeName: 'Мыс'),
    (TypeID: $6607; TypeName: 'Утес'),
    (TypeID: $6608; TypeName: 'Кратер'),
    (TypeID: $6609; TypeName: 'Плато'),
    (TypeID: $660a; TypeName: 'Лес'),
    (TypeID: $660b; TypeName: 'Ущелье, пропасть'),
    (TypeID: $660c; TypeName: 'Узкий проход'),
    (TypeID: $660d; TypeName: 'Перешеек'),
    (TypeID: $660e; TypeName: 'Лава'),
    (TypeID: $660f; TypeName: 'Столб, колонна'),
    (TypeID: $6610; TypeName: 'Равнина'),
    (TypeID: $6611; TypeName: 'Полигон'),
    (TypeID: $6612; TypeName: 'Заповедник'),
    (TypeID: $6613; TypeName: 'Хребет'),
    (TypeID: $6614; TypeName: 'Скала'),
    (TypeID: $6615; TypeName: 'Склон'),
    (TypeID: $6616; TypeName: 'Вершина холма или горы'),
    (TypeID: $6617; TypeName: 'Долина'),
    (TypeID: $6618; TypeName: 'Лес'),
    (TypeID: $5a00; TypeName: 'Километровый столб'),
    (TypeID: $5b00; TypeName: 'Колокол'),
    (TypeID: $5c00; TypeName: 'Место для дайвинга'),
    (TypeID: $5d00; TypeName: 'Дневной знак (зеленый квадрат)'),
    (TypeID: $5e00; TypeName: 'Дневной знак (красный треугольник)'),
    (TypeID: $6000; TypeName: 'Громкоговоритель'),
    (TypeID: $6100; TypeName: 'Дом'),
    (TypeID: $6200; TypeName: 'Отметка глубины'),
    (TypeID: $6300; TypeName: 'Отметка высоты'),
    (TypeID: $4000; TypeName: 'Гольф-клуб'),
    (TypeID: $4100; TypeName: 'Место для рыбалки'),
    (TypeID: $4200; TypeName: 'Обломки, развалины'),
    (TypeID: $4300; TypeName: 'Пристань'),
    (TypeID: $4400; TypeName: 'АЗС'),
    (TypeID: $4500; TypeName: 'Ресторан'),
    (TypeID: $4600; TypeName: 'Бар'),
    (TypeID: $4700; TypeName: 'Лодочный причал'),
    (TypeID: $4800; TypeName: 'Кемпинг'),
    (TypeID: $4900; TypeName: 'Парк'),
    (TypeID: $4a00; TypeName: 'Место для пикника'),
    (TypeID: $4b00; TypeName: 'Медпункт'),
    (TypeID: $4c00; TypeName: 'Справочная'),
    (TypeID: $4d00; TypeName: 'Автостоянка'),
    (TypeID: $4e00; TypeName: 'Туалет'),
    (TypeID: $4f00; TypeName: 'Душ'),
    (TypeID: $5000; TypeName: 'Питьевая вода'),
    (TypeID: $5100; TypeName: 'Телефон'),
    (TypeID: $5200; TypeName: 'Красивый вид'),
    (TypeID: $5300; TypeName: 'Лыжная база'),
    (TypeID: $5400; TypeName: 'Место для купания'),
    (TypeID: $5500; TypeName: 'Дамба, плотина'),
    (TypeID: $5600; TypeName: 'Запретная зона'),
    (TypeID: $5700; TypeName: 'Опасная зона'),
    (TypeID: $5800; TypeName: 'Ограниченный доступ')
  );

  function POI_TYPES_GetNameByID(const TypeID: integer): string;

  function KIND_TYPES_GetNameByID(const Kind: TPMFObjectKind; const TypeID: integer): string;

type
  TGeoCoordinate = record
    Lat: Extended;
    Long: Extended;
  end;

  TGeoCoordinatesArray = array of TGeoCoordinate;
  
  TPMFFileSectionParser = class
  public
    TypeID: Word;
    LabelName: ANSIString;
    Data0: TGeoCoordinatesArray; 

    class procedure ParseStringToData0(const S: ANSIString; out Data0: TGeoCoordinatesArray);
    class function Data0ToString(const Data0: TGeoCoordinatesArray): ANSIString;
    
    Constructor Create();
    Destructor Destroy; override;
    procedure LoadFromStr(const S: ANSIString);
    procedure SaveToStr(out S: ANSIString);
  end;



Implementation


function FormatFloat(const Format: string; Value: Extended): string;
begin
DecimalSeparator:='.';
Result:=SysUtils.FormatFloat(Format,Value);
end;

function StrToFloat(const S: string): Extended;
begin
DecimalSeparator:='.';
Result:=SysUtils.StrToFloat(S);
end;


function POLYLINE_TYPES_GetNameByID(const TypeID: integer): string;
var
  I: integer;
begin
for I:=0 to Length(POLYLINE_TYPES)-1 do
  if (POLYLINE_TYPES[I].TypeID = TypeID)
   then begin
    Result:=POLYLINE_TYPES[I].TypeName;
    Exit; //. ->
    end;
Result:='?';
end;

function POLYGON_TYPES_GetNameByID(const TypeID: integer): string;
var
  I: integer;
begin
for I:=0 to Length(POLYGON_TYPES)-1 do
  if (POLYGON_TYPES[I].TypeID = TypeID)
   then begin
    Result:=POLYGON_TYPES[I].TypeName;
    Exit; //. ->
    end;
Result:='?';
end;

function POI_TYPES_GetNameByID(const TypeID: integer): string;
var
  I: integer;
begin
for I:=0 to Length(POI_TYPES)-1 do
  if (POI_TYPES[I].TypeID = TypeID)
   then begin
    Result:=POI_TYPES[I].TypeName;
    Exit; //. ->
    end;
Result:='?';
end;


function KIND_TYPES_GetNameByID(const Kind: TPMFObjectKind; const TypeID: integer): string;
begin
case Kind of
pmfokPolyline: Result:=POLYLINE_TYPES_GetNameByID(TypeID);
pmfokPolygon: Result:=POLYGON_TYPES_GetNameByID(TypeID);
pmfokPOI: Result:=POI_TYPES_GetNameByID(TypeID);
else
  Result:='';
end;
end;


{TPMFFileSectionParser}
class procedure TPMFFileSectionParser.ParseStringToData0(const S: ANSIString; out Data0: TGeoCoordinatesArray);

  function SplitStrings(const S: string; out SL: TStringList): boolean;
  var
    SS: string;
    I: integer;
  begin
  SL:=TStringList.Create;
  try
  SS:='';
  for I:=1 to Length(S) do
    if (S[I] = ',')
     then begin
      if (SS <> '')
       then begin
        SL.Add(SS);
        SS:='';
        end;
      end
    else
     if (S[I] <> ' ') then SS:=SS+S[I];
  if (SS <> '')
   then begin
    SL.Add(SS);
    SS:='';
    end;
  if (SL.Count > 0)
   then Result:=true
   else begin
    FreeAndNil(SL);
    Result:=false;
    end;
  except
    FreeAndNil(SL);
    Raise; //. =>
    end;
  end;

var
  ValueStr: ANSIString;
  SL: TStringList;
  L,I: integer;
begin
SetLength(Data0,0);
ValueStr:=S;
ValueStr:=ANSIReplaceStr(ValueStr,'(',' ');
ValueStr:=ANSIReplaceStr(ValueStr,')',' ');
SplitStrings(ValueStr, {out} SL);
try
if ((SL.Count MOD 2) = 0)
 then begin
  L:=(SL.Count DIV 2);
  SetLength(Data0,L);
  for I:=0 to L-1 do begin
    Data0[I].Lat:=StrToFloat(SL[(I SHL 1)]);
    Data0[I].Long:=StrToFloat(SL[(I SHL 1)+1]);
    end;
  end
 else Raise Exception.Create('wrong coordinate string'); //. =>
finally
SL.Destroy;
end;
end;

class function TPMFFileSectionParser.Data0ToString(const Data0: TGeoCoordinatesArray): ANSIString;
var
  I: integer;
begin
Result:='';
if (Length(Data0) = 0) then Exit; //. ->
for I:=0 to Length(Data0)-1 do Result:=Result+'('+FormatFloat('0.####################',Data0[I].Lat)+','+FormatFloat('0.####################',Data0[I].Long)+')'+',';
SetLength(Result,Length(Result)-1);
end;

Constructor TPMFFileSectionParser.Create();
begin
Inherited;
end;

Destructor TPMFFileSectionParser.Destroy;
begin
Inherited;
end;

procedure TPMFFileSectionParser.LoadFromStr(const S: ANSIString);

  procedure GetNodeList(const S: ANSIString; out NL: TStringList);
  begin
  NL:=TStringList.Create;
  try
  NL.Text:=S;
  except
    FreeAndNil(NL);
    Raise; //. =>
    end;
  end;

  function GetNodeValue(const NodeList: TStringList; const NodeName: ANSIString; out Value: ANSIString): boolean;
  var
    S: ANSIString;
    LI,I: integer;
  begin
  Result:=false;
  for LI:=0 to NodeList.Count-1 do begin
    S:=NodeList[LI];
    I:=Pos(NodeName,S);
    if (I > 0)
     then begin
      I:=Pos('=',S);
      if ((I = 0) OR (I >= Length(S))) then Exit; //. ->
      Inc(I);
      Value:=Copy(S,I,Length(S)-I+1);
      Result:=true;
      Exit; //. ->
      end;
    end;
  end;

var
  NodeList: TStringList;
  TypeIDStr: ANSIString;
  ValueStr: ANSIString;
begin
GetNodeList(S,{out} NodeList);
try
if (GetNodeValue(NodeList,'Type',{out} TypeIDStr))
 then TypeID:=StrToInt(TypeIDStr)
 else TypeID:=Word(-1);
if (NOT GetNodeValue(NodeList,'Label',{out} LabelName)) then LabelName:='';
if (GetNodeValue(NodeList,'Data0', {out} ValueStr))
 then ParseStringToData0(ValueStr,{out} Data0)
 else SetLength(Data0,0);
finally
NodeList.Destroy;
end;
end;

procedure TPMFFileSectionParser.SaveToStr(out S: ANSIString);
begin
S:='Type='+'0x'+ANSILowerCase(IntToHex(TypeID,1));
if (LabelName <> '') then S:=S+#$0D#$0A+'Label='+LabelName;
if (Length(Data0) > 0)
 then begin
  S:=S+#$0D#$0A+'Data0='+Data0ToString(Data0);
  end;
end;


end.
