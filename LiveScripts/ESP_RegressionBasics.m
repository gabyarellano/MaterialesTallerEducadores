%% Regresión: Conceptos Básicos

load LinearData.mat x y                     % Cargar datos desde un archivo MAT
figure;
scatter(x,y)                                % Graficar los puntos de datos
xlabel("Área (pies cuadrados)")             % Etiquetar el eje X
ylabel("Precio listado (USD)")              % Etiquetar el eje Y
title("Precio listado vs área de una casa") % Agregar un título
%  Discutir tendencias o patrones en los datos
%% 
% Aquí tienes una variable dependiente (precio) y una independiente (área) que 
% parecen estar correlacionadas linealmente. Este es un problema de regresión lineal simple,
% que utiliza una línea recta para modelar la relación entre una variable dependiente (y)
% y una independiente (x):
%
% y = a0 + a1*x

load LinearData.mat x y 
a1 =70;            % Asignar valor al coeficiente a1
a0 =80000;         % Asignar valor al coeficiente a0

figure("Position",[0 0 800 400]);          % Configurar una figura para la gráfica
PlotFit(x,y,[a1 a0],0);                    % Llamar a la función auxiliar para graficar el ajuste polinómico y las muestras de datos
%% 
% Prueba diferentes valores de a1 y a0 para generar distintas líneas que modelen la relación.
%
% Ajusta los valores de a1 y a0 para encontrar una línea recta aproximada que modele o ajuste los datos.
%% 
% * ¿Qué tan fácil fue encontrar los mejores coeficientes?
% * ¿Cómo determinaste que esta línea es un buen ajuste para los datos?
% * ¿Ahora puedes estimar el precio de una casa con un área de 3800 pies cuadrados?
% * Según este modelo, ¿puedes predecir el valor de una casa con un área de 10000 pies cuadrados? Si es así, ¿qué suposiciones estás haciendo?

f = openfig('linearSoln.fig'); f2 = figure; set(f.Children(2),'Parent',f2)
%% 
% Mínimos Cuadrados Ordinarios
% Tu objetivo con la regresión es encontrar el mejor modelo que describa la variable dependiente
% como función de la(s) variable(s) independiente(s). Una forma de cuantificar qué tan bueno es tu modelo
% es calcular la suma de los errores cuadrados (SSE) entre los valores reales y los predichos de la variable dependiente.

load LinearData.mat x y                     % Cargar datos desde un archivo MAT
a1 = 140;                                   % Asignar valor al coeficiente a1
a0 = 4000;                                  % Asignar valor al coeficiente a0

figure("Position",[0 0 800 400]);
PlotFit(x,y,[a1 a0],1);                     % Visualizar los errores
%% 
% Sustituyendo el modelo de línea recta para los valores predichos, el objetivo de la regresión lineal simple se puede formular ahora como el siguiente problema de minimización:
% 
% $$\min_{a_0 ,a_1 } \sum_{i=1}^n {\left(y_i -\left(a_0 +a_1 x_i \right)\right)}^2$$
% 
% Puedes resolver esto analíticamente para $a_1$ y $a_0$ y obtener:
% 
% $a_1$=$\frac{\sum_{i=1}^n \left(x_i -\bar{x} \right)\left(y_i -\bar{y} \right)}{\sum_{i=1}^n 
% {\left(x_i -\bar{x} \right)}^2 }$                           
% 
% 
% 
% $$a_0 =\bar{y} -a_1 \bar{x}$$
% 
% donde
% 
% $\bar{x}$ es el promedio de todos los $x_i$
% 
% $\bar{y}$ es el promedio de todos los $y_i$
% 
% $i$ indica las muestras individuales de datos de un total de $n$ muestras
% 
% *Ejercicio:* Verifica si tu selección manual de |a1| y |a0| coincide con los valores que obtienes de esta solución analítica. Puedes hacerlo programáticamente (en modo *Code Inline*) o a mano.

xbar = mean(x)
ybar = mean(y)

% Calcula los valores de a1 y a0 usando las ecuaciones derivadas y las variables x, y, xbar y ybar.
% INGRESA EL CÓDIGO ABAJO



%% 
% 
% 
% 
% Regresión Lineal Múltiple
% Considera otra variable, además de los pies cuadrados o área de una casa, que pueda ayudar a informar los precios de la casa. Por ejemplo, puedes incluir el
% número de electrodomésticos adicionales y otras características especiales en la casa en tu análisis.
% 
% _*Tarea:* Haz clic en el botón de abajo para cargar y graficar los precios de las casas, el área y el número de características especiales en un diagrama de dispersión._

load MultivariateData.mat x1 x2 y                   % Cargar los datos
figure;
scatter3(x1,x2,y,"o")                               % Graficar los puntos de datos
xlabel("Características adicionales de la casa (#)") % Etiquetar los ejes
ylabel("Área (pies cuadrados)")
zlabel("Precio listado (USD)")                    
title("Precios de casas")                            % Agregar un título
view([-150 20])                                     % Ajustar la línea de visión
%% 
% *Reflexiona*
%% 
% * ¿Ves alguna tendencia o patrón en los datos?
%% 
% Aquí tienes una variable dependiente y dos independientes. Puedes realizar una _regresión multivariable_. Si el modelo es lineal en sus coeficientes, como la ecuación de un plano, también se llama _regresión lineal múltiple_.
% 
% $$y=ax_1 +bx_2 +c{\mathrm{x}}_3 +\ldotp \ldotp \ldotp$$
% 
% Esta vez, _estandaricemos_ las variables para facilitar la búsqueda de los coeficientes del modelo; es decir, centra y escala cada variable para que tenga una media de 0 y una desviación estándar de 1.
% 
% _*Tarea:* Usa la función_ <https://www.mathworks.com/help/matlab/ref/double.normalize.html 
% |_normalize_|> _para estandarizar las variables |x2| y |y| en los campos de edición dados a continuación._ 

load MultivariateData.mat x1 x2 y                     % Cargar los datos
x1 =normalize(x1);                                   % Estandarizar los datos para que tengan media 0 y desviación estándar 1
x2 =x2;
y = y;
%% 
% _*Tarea*: Haz clic en el botón *Run* para generar un plano con los coeficientes definidos abajo._

a =-0.2;
b =0.2;
c =0.008;

figure("Position",[0 0 800 400]);                     % Configurar una figura para la gráfica
PlotMultiFit(x1,x2,y,[a b c]);                        % Llamar a la función auxiliar para graficar el ajuste polinómico y las muestras de datos
%% 
% _*Prueba*_
%% 
% # _Usa los deslizadores para fijar los valores de los coeficientes $a$, $b$ y $c$ y generar diferentes planos para modelar la relación lineal._
% # _Fija los valores de |a|, |b| y |c| para encontrar el mejor plano que describa los datos. Esto puede ser muy desafiante. Para ayudar en el proceso, usa las herramientas de la gráfica como *Rotate* y *Pan* que aparecen en la esquina superior izquierda de la ventana de la figura._
%% 
% *Reflexiona*
%% 
% * ¿Qué tan fácil o difícil fue encontrar los mejores coeficientes para describir el modelo?
% * ¿Cómo determinaste que los coeficientes que elegiste generaron un buen ajuste?

disp("Usa el menú desplegable para revelar una solución probable")
matlab
Copy code

%% 
% 
% 
% 
% Regresión No Lineal
% Existen numerosos enfoques para modelar la respuesta no lineal del rendimiento 
% del cultivo a la salinidad del suelo. En esta sección, aplicarás y compararás 
% algunos otros modelos comúnmente utilizados para estimar el rendimiento del cultivo 
% en función de la salinidad del suelo. Un modelo comúnmente utilizado es una función 
% que describe una curva en forma de S invertida:
% 
% $$y=\frac{Y_{\max } }{1+{\left(\frac{x}{a}\right)}^b }$$
% 
% $Y_{\max }$ es el rendimiento máximo (donde la salinidad no tiene efecto sobre el rendimiento)
% 
% Nota que este modelo es no lineal en sus coeficientes.

load NonlinearData.mat x y                  % Cargar datos desde un archivo MAT
%% 
% Para facilitar los cálculos, estandariza el rendimiento dividiendo por el 
% rendimiento máximo.
% 
% $$y_{\textrm{rel}} \;=\;\frac{y}{Y_{\max } }=\frac{1}{1+{\left(\frac{x}{a}\right)}^b 
% }$$
% 
% _*Tarea:* Haz clic en el botón *Run* para graficar los datos del rendimiento del cultivo y el modelo de curva S._

yRel = y./max(y);
mdl = @(x,a,b) 1./(1+(x./a).^b);
a = 1;
b = 3.2;
 

% Código para graficar las muestras de datos y el modelo ajustado
figure("Position",[0 0 800 400])
PlotNlinFit(x,yRel,a,b,mdl);
%% 
% Los modelos que no son lineales en sus parámetros desconocidos se llaman modelos 
% de regresión _no lineal_. No existe un conjunto pequeño de reglas o formas generales 
% para describir todos los modelos no lineales. Pueden adoptar muchas formas diferentes. 
% Por lo tanto, debes elegir cuidadosamente una forma funcional adecuada para tus datos 
% y problema. Esto a menudo requiere mucha investigación y conocimiento del dominio.
% 
% *Prueba*
%% 
% # _Usa los deslizadores para fijar los valores de los parámetros_ $a$ y $b$ _para modelar la relación entre |x| y |y|._
% # _Fija los valores de_ |a| y b _para encontrar la mejor curva que describa los datos._
% # _Si estás usando este script en modo *Output inline*, reemplaza la función del modelo en el cuadro de texto para modelar una de las siguientes relaciones no lineales:_
%% 
% i)     $y_{\textrm{rel}} =\;e^{\textrm{ax}-b{\mathrm{x}}^2 }$
% 
% ii)     $y_{\textrm{rel}} =1-e^{a\left({\mathrm{e}}^{\textrm{bx}} \right)}$
% 
% Intenta encontrar los parámetros del modelo $a$ y $b$ para estos modelos. Nota que estos 
% pueden estar fuera del rango de los deslizadores proporcionados.
% 
% *Reflexiona*
%% 
% * ¿Qué consideraciones podrían ser necesarias para elegir uno de los modelos 
% no lineales para estos datos? (Consulta la literatura existente sobre el tema para ayudarte a responder esta pregunta.)

disp("Usa el menú desplegable para revelar una solución probable")
%% 
%  
%% Cost Function
% So far in this module, you used slider controls to manually find the values 
% of unknown parameters of the models, such as the coefficients of a polynomial. 
% Regression analysis involves finding these unknown parameters more systematically. 
% To do this, we minimize the "cost" associated with a poorly fitted model. You 
% can use any measure of the goodness of fit as a _cost function_. This makes 
% regression into an optimization problem essentially. The goal is to minimize 
% the cost function to estimate the model's unknown parameters.
% 
% In a previous section, you used the sum of squared errors (SSE)  to measure 
% the goodness of fit. A related measure is the mean squared error (MSE)—an average 
% of squared prediction errors for a given number of sample data points. 
% 
% $$\textrm{MSE}=\frac{1}{n}\sum_{i=1}^n {\left(y_i -{\hat{y} }_i \right)}^2$$
% 
% $y_i \;$            is the actual value of the dependent variable corresponding 
% to the $i^{\textrm{th}}$ data sample out of $n$ total samples
% 
% ${\hat{y} }_i \;$            is the predicted value corresponding to the $i^{\textrm{th}}$ 
% data sample out of $n$ total samples
% 
% 
% 
% Next, formalize the objective of regression by using the mean squared error 
% as a cost function.
% 
% *Cost function:* 
% 
% $$J\left(\theta_1 ,\theta_2 ,\ldotp \ldotp \ldotp \right)=\;\frac{1}{n}\sum_{i=1}^n 
% {\left(y_i -f\left(x_i ,\theta_1 ,\theta_2 ,\ldotp \ldotp \ldotp \right)\right)}^2$$
% 
% $\theta_1 ,\theta_2 ,\ldotp \ldotp \ldotp$        are the model parameters
% 
% $f$                  is the function describing the model; that is, the relationship 
% between the dependent and independent variables 
% 
% *Objective*:
% 
% $$\min_{\theta_1 ,\theta_2 ,\ldotp \ldotp \ldotp } \sum_{i=1}^n J\left(\theta_1 
% ,\theta_2 ,\ldotp \ldotp \ldotp \right)$$ 
% 
% 
% 
% In the Ordinary Least Squares approach, we minimized the sum of squared errors 
% (SSE) to solve for the parameters ($a_1$ and $a_0$) analytically. Such analytical 
% solutions cannot be easily found for the more complex models, or they might 
% not even exist. So, you iteratively search for the parameters in a way that 
% makes the cost smaller!

load LinearData2.mat x y
%% 
% _*Task:* Fit a linear regression model to predict |y| by setting the coefficients 
% |a1| and |a0|. Use the displayed MSE value as a guide to iteratively improve 
% your selection of coefficients._

a1 =1.4;
a0 =0.9;
 
figure("Position",[0 0 800 400])
yhat = PlotFit(x,y,[a1 a0],0);                             % Call the helper function to plot the linear fit and the data samples
MSE = mean((y-yhat).^2);                                   % Calculate the mean squared error

% Annotate plot
text(-1,6,"MSE = " + MSE,"FontSize",14)                    % Include the MSE on the plot for reference to update the fit
%% 
% *Reflect*
%% 
% * Did the value of MSE in each attempt help guide your search? How?
% * What other possible cost functions can you think of?

disp("Use the dropdown to reveal a likely solution")
%% 
% 
% 
% 
%% Gradient Descent
% Gradient descent is an algorithmic solution for iteratively minimizing the 
% cost function and estimating the unknown model parameters. As the name implies, 
% this algorithm works by computing the cost function's _gradients_. These are 
% the partial derivatives of the cost function with respect to each model parameter. 
% The parameters are then updated in each iteration by subtracting the respective 
% partial derivatives from their current values. 

load LinearData2.mat x y
%% 
% _*Task:* Click the *Run* button to visualize how gradient descent works._

LearningRate = 0.07;            
NumSteps = 30;
 

figure("Position",[0 0 800 600])                                     % Set up a figure for the plot                       
[a1,a0,mse] = GradientDescent(x,y,NumSteps,LearningRate);            % Call the helper function to perform gradient descent and visualize the plots
%% 
% Here, we consider a simple case with only two coefficients. Visualize the 
% relationship between the MSE and the model coefficients $a_0$ and $a_1$ in a 
% 3-D plot. This plot resembles a valley with one minimum (red dot). Remember, 
% our goal is to reach that minimum. Starting at an initial point (for instance, 
% at one of the top corners), the gradient descent algorithm calculates the direction 
% to go down the valley. This is done in several steps or over many _iterations_. 
% The step size is described by a <https://www.mathworks.com/support/search.html/videos/applied-machine-learning-part-3-hyperparameter-optimization-1547849445386.html?fq=asset_type_name:video%20category:stats/regression-and-anova&page=1 
% _hyperparameter_> called the _learning rate_.
% 
% _*Try*_ 
%% 
% # _Use the sliders to try different learning rates and number of iterations. 
% Then click the *Run* button to observe gradient descent in action._
% # _Set the LearningRate to 0.01._
% # _To combat the low learning rate, increase NumSteps to 80._
% # _Set the LearningRate to 0.25 and NumSteps to 30._
% # _Increase the LearningRate to 0.35 and NumSteps to 50|._|
%% 
% *Reflect*
%% 
% * What happens when you choose a low learning rate?
% * What happens when you choose a high learning rate?
% * How does the number of steps affect the outcome?
%% 
% With MSE as the cost function and a simple linear regression model, these 
% are the gradient equations:
% 
% $$\frac{d\left(f\right)}{da_1 }=\frac{2\alpha }{n}\sum_{i=1}^n x_i \left({\hat{y} 
% }_i -y_i \right)$$                    $$\frac{d\left(f\right)}{da_0 }=\frac{2\alpha 
% }{n}\sum_{i=1}^n \left({\hat{y} }_i -y_i \right)$$
% 
% $\alpha$ is the learning rate.
% 
% 
% 
% 
%% Practice Problem
% Electricity load forecasting
% The amount of electricity required to support an electrical grid is also referred 
% to as the _*load*_ on the grid, and it varies significantly over a day. Having 
% a forecast of the electrical load is vital to several entities. It helps utility 
% companies plan how much electricity their power plants will need to produce. 
% It also supports energy traders to gain insight into upcoming market dynamics.Below 
% is an example profile of the electrical load on the grid in New York City.
% 
% 
% 
% *NOTE:* This section requires you to download external data from <http://mis.nyiso.com/public/ 
% New York ISO> and take approximately 1-5 minutes (depending on your internet 
% connection). The script ElectricityLoadData|.mlx| included with this module 
% downloads, formats, and saves the data.
% 
% _*Task:* Click the *Open script to load data* button to open ElectricityLoadData|.mlx|. 
% Set the parameters in this script to download electricity data for the start 
% and end dates given below._
% 
% *Start date:* |2015-Jan-01|                *End date:* |2020-Dec-31|

edit ElectricityLoadData.mlx
 
%% 
% As a first step, try simple linear regression to predict future electrical 
% load. You will use only the electrical load as a dependent variable and time 
% as an independent variable.
% 
% _*Task:* Select a time granularity for electricity data. Click the *Run* button 
% to perform linear regression with time as the independent variable._

load nyiso_cleaned.mat nyiso

% Select granularity of electricity data
tt = retime(nyiso,"daily","mean")       
 
%% 
% Use the function <https://www.mathworks.com/help/stats/fitlm.html |fitlm|> 
% to fit a linear regression model.

DateNos = datenum(tt.Date)                       % Convert the datetime variable into numeric values to apply regression.
mdl = fitlm(DateNos,tt.HUDVL);                   % Fit a linear regression model

% Display model parameters and the MSE
coeffs = mdl.Coefficients
MSE = mdl.MSE
%% 
% Use <https://www.mathworks.com/help/releases/R2020b/stats/linearmodel.plot.html#responsive_offcanvas 
% |plot|> with the fitted model to visualize a scatter plot of the data and the 
% line fit.

plot(mdl)

% Format the x-axis labels into date and time values.
xticklabels(datestr(xticks))
xtickangle(30)
%% 
% _*Try*_
%% 
% # _Use the dropdown menu to choose the granularity of the load data._
% # _Observe the error in |mse| after clicking *Run*._
%% 
% *Reflect*
%% 
% * When does the highest error occur?
% * When does the lowest error occur?
% * What granularity is the linear regression better for? What does that indicate?
%% 
% Once you have a model, you can use the <https://www.mathworks.com/help/stats/linearmodel.predict.html 
% predict> function to compute the dependent variable's value for any given independent 
% variable values.

% Choose a date to make a prediction for the electrical load
PredDay = 21;
PredMonth = 8;
PredYear =2021;
 

PredDate = datetime(PredYear,PredMonth,PredDay);                                % Convert the chosen data, month, and year into a MATLAB datetime type
PredLoad = predict(mdl,datenum(PredDate));                                      % Use the fitted model to predict for the chosen data

disp("Your model predicts a load of " + PredLoad + "MW for "+ datestr(PredDate))   % Display the result from prediction
%% 
% Although you did not achieve a very accurate forecast for high-granularity 
% data in the previous section, can you use the results to model the long-term 
% trend?
% 
% _*Quiz:* Study the results from the task above and select all that apply._
% 
% *A. The electricity load in Hudson Valley is likely to increase in 2021 compared 
% to 2020.*

increase = false;
%% 
% *B.* *The electricity load in Hudson Valley is likely to decrease in 2021 
% compared to 2020.*

decrease = false;
%% 
% 

disp("Use the dropdown to reveal answer")
%% 
% *Reflect*
%% 
% * Can you think of any other factors or variables which might influence the 
% electricity load at a given instance?
%% Further Exploration
% Multiple predictors for short-term electricity load forecast
% As you may have noticed in the practice problem, with |Date| as your only 
% independent variable, the electricity load forecast does not tend to be very 
% accurate at an hourly granularity. 
% 
% Independent variables are also referred to as _explanatory variables_ or _predictor_ 
% _variables*,*_ or simply _predictors_. A different independent variable or even 
% a combination of variables can improve our ability to model the data and make 
% predictions. Here, you are given a function GetMultiPredictors that generates 
% three different predictors for the hourly electricity load (MW). 
% 
% _*a. Task:* Click *Generate Predictors* to run this section to see the predictors._

load nyiso_cleaned.mat nyiso                                  % Load data from the saved MAT file
[HourlyLoad,dates,predictors] = GetMultiPredictors(nyiso);    % Use helper function to generate some additional predictors from the data
 

disp(predictors)
%% 
% *Reflect*
% 
% Observe the |predictors| variable displayed above. 
%% 
% * Do you notice a pattern to help identify what physical quantities these 
% three predictors represent? *Hint:* Scroll to see more rows of data, and compare 
% each column with the HourlyLoad values.
% * How far into the future will our model will be able to forecast given this 
% selection of predictors? Why?
%% 
% _*b. Task:*_ Click *Fit Linear Regression* to fit a multiple linear regression 
% model to the data in |predictors| to predict the response variable HourlyLoad|.|

 

% Fit the linear regression model.
mdl = fitlm(predictors,HourlyLoad);
coeffs = mdl.Coefficients
MSE = mdl.MSE

% Use the the fitted model to get predicted hourly load values and compare them with the actual values.
PredLoad = predict(mdl,predictors);

% Plot the actual and predicted load.
figure
plot(dates,HourlyLoad,"o","MarkerSize",4)
hold on
plot(dates,PredLoad,"r")
hold off

% Label the plot
legend("Actual","Predicted")
xlabel("Time")
ylabel("Hourly Load (MW)")
title("Electricity Load: Multiple Linear Regression")
%% 
% _*c. Task:* Zoom into a small window of time by setting the axis limits using 
% the sliders given below._

% Zoom into a small window of time by setting the axis limits
xlim([datetime(2020,1,12,"TimeZone","America/New_York")... % set lower limit for day of month
    datetime(2020,1,18,"TimeZone","America/New_York")])  % set upper limit for day of month
%% 
% *Reflect*
%% 
% * By visually analyzing the data and the model predictions, do you find this 
% an acceptable model? 
%% 
% 
% 
% 
%% Funciones auxiliares
% Función para graficar una regresión lineal de una variable de cualquier grado.

function yhat = PlotFit(x,y,A,ErrorFlag)

% Preparar los datos y calcular las predicciones del modelo
powers = length(A)-1:-1:0;
X = x'.^powers;
yhat = A*X';

% Graficar
plot(x,y,"o");
DispLine = sprintf("\nAjuste lineal \n" + "y = " + join(A + ["x^{"+string(powers(1:end-1))+"}",""] ," + "),"Interpreter","tex");
xlim([min(x)-0.5,max(x)+0.5]);
ylim([min(y)-0.5,max(y)+0.5]);
hold on
fplot(@(x)A*(x'.^powers)',"LineWidth",1.5);
legend("Muestras de datos",DispLine,"Location","eastoutside")
hold off
xlabel("x")
ylabel("y")
title("Modelo lineal")

if ErrorFlag
    hold on
    DispSSE = sprintf("\nErrores \nSSE = %12g",sum(yhat-y).^2);
    errorbar(x,y,min(yhat-y,0),max(yhat-y,0),".","vertical","DisplayName",DispSSE,SeriesIndex = 3);
    hold off
end

end
%% 
% Función para graficar un ajuste de plano basado en sus coeficientes.

function yhat = PlotMultiFit(x1,x2,y,coeffs)

% Separar los coeficientes en variables individuales y estimar y.
[a,b,c] = deal(coeffs(1),coeffs(2),coeffs(3));
yhat = a.*x1 + b.*x2 + c;

% Graficar
scatter3(x1,x2,y);
xlim([min(x1)-0.1,max(x1)+0.1]);
ylim([min(x2)-0.1,max(x2)+0.1]);
zlim([min(y)-0.1,max(y)+0.1]);
[X1,X2] = meshgrid(xlim,ylim);
hold on
surf(X1,X2,a.*X1 + b.*X2 + c,"FaceAlpha", 0.4,"FaceColor",[1 0.5 0.5],"EdgeColor","none");
hold off
% Anotaciones
title("Modelo lineal múltiple")
DispPlane = sprintf("\nAjuste de plano"+"\ny = " + a + "x_{1} + " + b + "x_{2} + " + c);
legend("Muestras de datos",DispPlane,"Location","eastoutside");
view([-150 20])
xlabel('x_{1}'), ylabel('x_{2}'), zlabel("y")

end
%% 
% Función para graficar un ajuste no lineal basado en la función del modelo (mdl) y dos parámetros (a,b).

function PlotNlinFit(x,yRel,a,b,mdl)
plot(x,yRel,"o");                                       % Graficar las muestras de datos
hold on
fplot(@(x)mdl(x,a,b))                                   % Graficar el modelo ajustado
hold off
title("Modelo no lineal")                               % Agregar título
xlabel("Salinidad en la zona radicular (dS/m)")         % Etiqueta del eje X
ylabel("Rendimiento relativo del cultivo")              % Etiqueta del eje Y
str = compose("$y = \\frac {1}{1+(\\frac {x}{%2g})^{%2g}}$",a,b);
legend("Muestras de datos",newline + "Ajuste curva S","Interpreter","latex")
text(10.5,0.7,str,"Interpreter","latex","FontSize",20);
end
%% 
% Función para realizar y visualizar el descenso por gradiente usando el costo de error cuadrático medio para regresión lineal.

function [a1,a0,mse] = GradientDescent(x,y,steps,LearningRate)

% Preparar variables para visualizar la superficie de la función de costo
[M,B] = meshgrid(-10:0.1:10,-10:0.1:10);
cost = arrayfun(@(m,b)CostFunc(m,b,x,y),M,B);

% Inicializar bucle
a1 = 7;                       % valor inicial de la pendiente
a0 = 7;                       % valor inicial de la ordenada al origen
n = length(x);                % número total de puntos de datos
mse = CostFunc(a1,a0,x,y);    % calcular el MSE inicial
r = logspace(-0.5,0,steps);   % intensidades de color rojo para las gráficas

% Graficar tres visualizaciones diferentes
T = tiledlayout(2,2,"TileSpacing","compact","Padding","compact");

% Gráfica 1: superficie
nexttile(T,1)
surf(M,B,cost,"EdgeColor","none")
hold on
plot3(a1,a0,mse,"*",SeriesIndex = 2);
hold off
colormap(parula(30))
view([-16 33])
xlabel("a1"), ylabel("a0"), zlabel("Costo (MSE)")

% Gráfica 2: contorno
nexttile(T,2)
contour(M,B,cost,30,"LineWidth",2)
hold on
plot(a1,a0,"*","MarkerSize",8,SeriesIndex = 2)
hold off
xlabel("a1"), ylabel("a0")

% Gráfica 3: ajuste lineal
title(T,"Descenso por gradiente")
nexttile(T,[1,2])
plot(x,y,"o")
hold on
FitLine = plot(xlim,a1.*xlim+a0,"-","LineWidth",1.5,SeriesIndex = 2);
hold off
ylim([-10,10]), xlabel("x"), ylabel("y")


for step=1:steps

    % Calcular descenso por gradiente
    pause(0.02)
    yhat = a1*x + a0;
    diff = yhat - y;
    da1 = LearningRate * sum(diff .* x) * 2 / n;
    da0 = LearningRate * sum(diff) * 2 / n;
    a1 = a1 - da1;
    a0 = a0 - da0;
    mse = CostFunc(a1,a0,x,y);

    % Graficar los nuevos datos de la iteración sobre las gráficas existentes
    nexttile(T,1)
    hold on
    plot3(a1,a0,mse,"*",SeriesIndex = 2);
    hold off

    nexttile(T,2)
    hold on
    plot(a1,a0,"*","MarkerSize",8,SeriesIndex = 2)
    hold off

    nexttile(T,3)
    FitLine.YData = a1*xlim+a0;
    title("a1 = "+a1 + ", a0 = "+a0, "MSE = "+mse)

end
end
%% 
% Función para calcular el error cuadrático medio para un ajuste lineal.

function mse = CostFunc(m,b,x,y)
yhat = m*x+b;
mse = sum((yhat-y).^2)/length(x);
end
