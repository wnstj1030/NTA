package com.example.junijuni;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
public class JuniController {
    private final JuniService juniService;

    @PostMapping
    public ResponseEntity<Void> saveData (@RequestBody Dto data) {
        juniService.execute(data);
        return ResponseEntity.ok().build();
    }

    @GetMapping
    public ResponseEntity<Optional<Dto>> getData() {
        Optional<Dto> data = juniService.dataGet();
        return ResponseEntity.ok(data);
    }

    @DeleteMapping
    public ResponseEntity<Void> deleteData() {
        juniService.dataDelete();
        return ResponseEntity.ok().build();
    }
}
