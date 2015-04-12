# ITIS_Haskel_Homework
##### First homework

Not full functional  | Not functional
------------- | -------------
Groovy  | Ada
SmallTalk  | Fortran
C++  | Pascal
PHP  | C
Go  | Prolog
Factor  | 1C
Ruby  | Assembler
Perl  | Forth
Swift  | Befunge-93
Rust  | Smetana
C#  | SMITH
Lua  | Muriel
JavaScript  | ArnoldC
Python  | Malbolge
JavaScript  | HQ9+


####Императивный и Функциоальный подходы
В данной статье я хочу рассказать вам о императивном и функциональном стиле программировании.

**Императивный стиль** программирование распространен, суть его заключается в описание действий для достижения результата. Он базируется на архитектуре фон Неймана и большую часть кода идет манипуляции с переменными. Переменные – часть памяти машины, изменения которых ведет к новому состоянию.
Перед программистом стоит задача написания пошаговой инструкций для получения результата.
```java
...
int ret = 1                     ;
for (int i = 1; i <= n; ++i)    {
    ret *= i                    ;
                                }
...
```
Данный код является примером реализации факториала на императивном языке программирования Java. Здесь описываются действия, которые нужно совершить машине:
<ul>
	<li>Инициализируй переменную <code>ret</code></li>
	<li>Проделай <code>n</code> подходов:
		<ul>
			<li>Перемножь переменную <code>ret</code> на номер подхода</li>
		</ul>
	</li>
</ul>

**Функциональный стиль** программирования, не сильно распространен, но имеет тенденцию роста.<br>
Он отличается от императивного стиля тем, что программист пишет не то «как» нужно сделать чтобы что-то получить, а «что» он хочет получить.
```haskell
...
factorial 0 = 1
factorial n = n * factorial (n-1)
...
```

Данный код является аналогом предыдущего кода подсчета факториала в декларативном языке программирования Haskell. Обратим внимания, что мы не описываем последовательность действий, которые нужно совершить машине, а некоторой образец, которой говорит «что» мы хотим получить:
<ul>
	<li>Пусть факториал от <code>0</code> будет <code>1</code></li>
	<li>Пусть факториал от числа <code>n</code> будет умножение числа <code>n</code> на факториал числа <code>n-1</code></li>
</ul>
Данный образец интерпретируется языком в декларативные утверждения.

####Задание№2
Написать функции:
<ul>
<li>Факториала</li>
<li>Фибоначчи</li>
<li>Аккермана</li>
</ul>

####Задание№3
######Задача№1

PROBLEM A:

 You want to develop a system that will perfectly heat
 your breakfast oatmeal every morning.
 You are using an old stove, which can only heat oatmeal between 0°C and 20°C.
 Based on your breakfast preferences, the perfect temperature is exactly 10°C.
 Design a data definition to represent the possible oatmeal temperatures.
 Call it OatmealTemp.

 PROBLEM B:
 You need the system to adjust your stove to ensure your oatmeal
 is heated just right.
 If the stove is too hot, its knob should be turned to the left.
 If it is too cold, the knob should be turned right.
 And if it is at the perfect temperature, it should be left as is.
 Design a data definition to represent the stove adjustment required.
 Call it Adjustment.

___

**Functions:**
 
 PROBLEM C:
 Design a function that will determine the required stove adjustment
 based on the current oatmeal temperature.
 Call it oatmeal-temp-to-adjustment.
 
######Задача№2

 Data definitions:
 PROBLEM A:
 You are working on a system that will automate delivery for
 YesItCanFly! airlines catering service.
 There are two dinner options for each passenger, chicken or pasta.
 They can also choose not to order a meal,
 which the system records as false.
 Design a data definition to represent a dinner order.
 Call the type DinnerOrder.
___
 **Functions:**
 
 PROBLEM B:
 Design the function dinner-order-to-msg that consumes a dinner order
 and produces a message for the flight attendants saying
 what the passenger ordered.
 For example, calling dinner-order-to-msg for a chicken dinner
 would produce "The passenger ordered chicken."


####Задание№4
######Задача№1

Создать тип данных для бинарного дерева поиска (binary search tree), хранящего значения типа Int.
Реализовать функцию подсчёта высоты этого дерева.
Реализовать функцию суммирования всех элементов в дереве.
Реализовать функцию поиска заданного элемента в дереве.

######Задача№2

Создать тип данных для бинарного дерева, хранящего в листьях элементы произвольного типа.
Реализовать функцию подсчёта высоты этого дерева.
Реализовать функцию tmap, принимающюю дерево и функцию преобразования элемента (a -> b) и возвращающую новое дерево той же формы, но содержащее элементы, полученные применением функции к исходным элементам.

######Задача№3
Создать тип данных для списков, в которых чередуются элементы двух разных типов. Например, список из строк и целых чисел может быть таким: <code>["Hello", 5, "World", 15]</code> (синтаксис является псевдокодом, в программе этот список будет выглядеть по-другому).
Реализовать функцию определения длины такого списка.
Реализовать функцию dmap, принимающую такой список и две функции преобразования элементов, и возвращающую новый список, содержащий преобразованные элементы в том же порядке, что и исходные.
