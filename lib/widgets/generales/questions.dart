// questions.dart

class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;
  final String imagePath;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    required this.imagePath,
  });
}

final List<Question> questions = [
  Question(
    questionText: "En cual de estas dos calles se puede realizar un rebase?",
    options: ["Izquierda", "Derecha"],
    correctAnswerIndex: 0,
    imagePath: 'assets/questions/question1.png',
  ),
  Question(
    questionText: "¿Es correcto para este automóvil estacionarse en esta banqueta roja?",
    options: [
      "Únicamente si es por tiempo limitado",
      "Siempre y cuando sea una emergencia",
      "Está prohibido"
    ],
    correctAnswerIndex: 2,
    imagePath: 'assets/questions/question2.png',
  ),
  Question(
    questionText: "El artículo 75 refiere En los cruceros se restringe la circulación cuando:",
    options: [
      "No haya espacio libre en la cuadra siguiente para que los vehículos avancen",
      "Cuando el artista urbano no haya terminado su show",
      "Cuando no haya alguna manera de evitar baches en el crucero"
    ],
    correctAnswerIndex: 0,
    imagePath: 'assets/questions/question3.png',
  ),
  Question(
    questionText: "¿Al dar vuelta a la izquierda en los cruceros el conductor puede escoger libremente el carril que le convenga?",
    options: [
      "Sí, siempre que esté libre el carril y utilice sus intermitentes.",
      "Solamente el carril de extremo izquierdo junto al camellón o raya central"
    ],
    correctAnswerIndex: 1,
    imagePath: 'assets/questions/question4.png',
  ),
  Question(
    questionText: "En las glorietas, donde la circulación no esté controlada por semáforos, ¿Quien tiene prioridad?",
    options: [
      "Los conductores que ya se encuentren circulando en ella",
      "Los conductores que se van incorporando"
    ],
    correctAnswerIndex: 0,
    imagePath: 'assets/questions/question5.png',
  ),
  Question(
    questionText: "¿Le es permitido a este operador detenerse en doble fila?",
    options: [
      "Está prohibido estacionarse",
      "Solamente si va a subir/bajar pasaje",
      "Solamente si es un área delimitada para transporte público"
    ],
    correctAnswerIndex: 0,
    imagePath: 'assets/questions/question6.png',
  ),
  Question(
    questionText: "¿Está permitido rebasar desde el carril derecho?",
    options: [
      "No, únicamente se puede rebasar desde la izquierda y en la imagen hay línea continua por la derecha",
      "Si está permitido en vías de dos o más carriles de circulación en el mismo sentido, cuando el carril de la derecha permite circular con mayor rapidez."
    ],
    correctAnswerIndex: 1,
    imagePath: 'assets/questions/question7.png',
  ),
  // Nueva pregunta 8
  Question(
    questionText: "La restricción de la señal de alto es para:",
    options: [
      "Revisar el entorno, si es necesario frenar y continuar",
      "Alto total y continuar",
      "Únicamente si hay un oficial levantando el brazo derecho"
    ],
    correctAnswerIndex: 1,
    imagePath: 'assets/questions/question8.png',
  ),
  // Nueva pregunta 9
  Question(
    questionText: "En Tijuana Baja California los señalamientos de límite de velocidad están:",
    options: [
      "Al ser un estado fronterizo están marcados en Millas por hora",
      "Sujetos a la prudencia del conductor",
      "Marcados en las vialidades en Kilómetros por hora"
    ],
    correctAnswerIndex: 2,
    imagePath: 'assets/questions/question9.png',
  ),
  // Nueva pregunta 10
  Question(
    questionText: "En la imagen que indicación está dando la oficial?",
    options: [
      "Indicando el flujo con la mano derecha y con la izquierda una señal preventiva",
      "Indicando en qué punto deben detenerse totalmente los vehículos hasta que indique cuando pueden continuar"
    ],
    correctAnswerIndex: 0,
    imagePath: 'assets/questions/question10.png',
  ),
  // Nueva pregunta 11
  Question(
    questionText: "Que está prohibido para los ciclistas:",
    options: [
      "Desplazarse en estado de ebriedad (al ser un vehículo sin motor)",
      "Utilizar luces y reflejantes",
      "Rebasar por la izquierda"
    ],
    correctAnswerIndex: 0,
    imagePath: 'assets/questions/question11.png',
  ),
  // Nueva pregunta 12
  Question(
    questionText: "¿Qué significa esta señal?",
    options: [
      "Vuelta en U no permitida",
      "Vuelta en U permitida",
      "Curva cerrada a la izquierda",
      "Giro hacia la izquierda obligatorio"
    ],
    correctAnswerIndex: 0,
    imagePath: 'assets/questions/question12.png',
  ),
  // Nueva pregunta 13
  Question(
    questionText: "Cuando haya una línea amarilla sólida y una discontinua en carriles opuestos de tráfico, no debes rebasar",
    options: [
      "Si la línea discontinua está de tu lado",
      "Si la línea discontinua no está de tu lado",
      "Ninguna de las anteriores"
    ],
    correctAnswerIndex: 1,
    imagePath: 'assets/questions/question13.png',
  ),
  // Nueva pregunta 14
  Question(
    questionText: "Esta señal de advertencia indica",
    options: [
      "Vialidad dividida",
      "Inicio de vialidad con camellón",
      "Prohibido rebasar en la próxima vialidad"
    ],
    correctAnswerIndex: 0,
    imagePath: 'assets/questions/question14.png',
  ),
  // Nueva pregunta 15
  Question(
    questionText: "¿Esta señal qué significa?",
    options: [
      "Área de parada para observar fauna silvestre",
      "Precaución con fauna silvestre",
      "Área de ganado"
    ],
    correctAnswerIndex: 1,
    imagePath: 'assets/questions/question15.png',
  ),
  // Nueva pregunta 16
  Question(
    questionText: "En un camino con tres o más carriles viajando en la misma dirección, el carril más cercano a la izquierda es usado para…",
    options: [
      "Rebasar vehículos más lentos",
      "Rebasar vehículos más rápidos",
      "Dar paso a vehículos de emergencias"
    ],
    correctAnswerIndex: 0,
    imagePath: 'assets/questions/question16.png',
  ),
  // Nueva pregunta 17
  Question(
    questionText: "¿Cuántas personas pueden ser transportadas por un vehículo?",
    options: [
      "La cantidad de asientos",
      "Cuantos logren entrar mientras estén sentados o acostados",
      "El señalado en la correspondiente tarjeta de circulación"
    ],
    correctAnswerIndex: 2,
    imagePath: 'assets/questions/question17.png',
  ),
  // Nueva pregunta 18
  Question(
    questionText: "En caso de un accidente es necesario que el conductor:",
    options: [
      "Permanezca en el lugar y cerciorarse que los ocupantes del vehículo se encuentren en buen estado.",
      "Dejar sus datos e irse del lugar",
      "Mantenerse dentro del vehículo y esperar"
    ],
    correctAnswerIndex: 0,
    imagePath: 'assets/questions/question18.png',
  ),
  // Nueva pregunta 19
  Question(
    questionText: "Que calle lleva más preferencia de vía",
    options: [
      "La cual este en sentido de norte a sur",
      "Ninguna tiene preferencia",
      "La calle pavimentada"
    ],
    correctAnswerIndex: 2,
    imagePath: 'assets/questions/question19.png',
  ),
];