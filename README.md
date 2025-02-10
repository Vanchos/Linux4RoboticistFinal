# Linux4RoboticistFinal
Финальная работа по курсу Linux для робототехников. Docker Image для робота

 ## Гипотетический робот "Wheelchair Rider Helper"
 ### Задача робота
 Робот предназначен для предотвращения наезда инвалидной коляски с ручным приводом на препятствие, которое она преодолеть не в состоянии.
 ### Способ решения
1. Своевременное отслеживание приближения каждого колеса коляски к непреодолимому препятствию.  
> Критерий "непреодолимости" задается в виде высоты препятствия над уровнем поверхности.  
> Своевременность определяется количеством секунд до столкновения.
2. Препятствование продолжению движения в выбранном направлении в случае срабатывания критериев "непреодолимости" и "своевременности"
### Реализация
![](/doc/sxema-1.png)
В качестве реализации предлагается создать программно-аппаратный комплекс, реагирующий на сближение с опасным препятствием путем запуска механизма торможения.\
Данный комплекс должен будет монтироваться на все типовые конструкции инвалидных колясок.\
Состав аппаратной части комплекса:
- контроллер для размещения программной сроставляющей и для подключения аппаратных элементов комплекса
- лазерный дальномер в количестве 2 шт, размещаемый на фронтальной части коляски напротив правого и левого колес, на высоте, обеспеччивающей обнаружение непреодолимого препятсявия и работающий с частотой позволяющей заблаговременно определить опасное сближение в зависимости от скорости движения коляски
- камера в количестве 2 шт,размещаемая на фронтальной части коляски, напротив каждого из колес для визуального контроля обстановки пользователем
- монитор для показа изображений с камер
- привод тормоза в количестве 2 шт монтируемый на каждое из колес и формирующий необходимое сопротивление для вращения колес для обеспечения плавного торможения
- кнопка принудительного торможения для ручного включения привода тормоза

