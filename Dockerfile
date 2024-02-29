FROM openjdk:11
COPY ./target/CalculatorDev-0.0.1-SNAPSHOT.jar ./
WORKDIR ./
CMD ["java", "-jar", "CalculatorDev-0.0.1-SNAPSHOT.jar"]