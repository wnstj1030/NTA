package com.example.junijuni;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class JuniService {
    private final JuniRepository juniRepository;

    public void execute(Dto dto) {
        juniRepository.deleteAll();
        juniRepository.save(JuniEntity.builder()
                        .id(1L)
                        .message(dto.getMessage())
                        .type(dto.getType())
                        .timestamp(dto.getTimestamp())
                .build());
    }

    public Optional<Dto> dataGet() {
        Optional<JuniEntity> juniEntity = juniRepository.findById(1L);
        return juniEntity.map(entity -> new Dto(entity.getType(), entity.getMessage(), entity.getTimestamp()));
    }

    public void dataDelete() {
        juniRepository.deleteById(1L);
    }

}
