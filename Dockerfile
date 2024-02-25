FROM openjdk:11
COPY ./target/CalculatorDev-1.0-SNAPSHOT-jar-with-dependencies.jar ./
WORKDIR ./
CMD ["java", "-jar", "CalculatorDev-1.0-SNAPSHOT-jar-with-dependencies.jar"]