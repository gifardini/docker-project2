FROM rust:1.40 as builder 

WORKDIR /app
COPY . .

RUN rustup default nightly && rustup update
RUN cargo build --locked --release

#executavel
FROM debian:stable-slim 
RUN useradd -ms /bin/bash appRust
USER appRust

#FROM gcr.io/distroless/cc-debian11
WORKDIR /app

COPY --from=builder /app/templates/* templates/ 
COPY --from=builder /app/target/release/projeto-labbd .

CMD ["./projeto-labbd"]