package com.ptit.itjob.common;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class FileUtil {

    public static String upload(MultipartFile file, String directory) {
        try {
            Path path = Paths.get(directory);
            Files.copy(file.getInputStream(), path.resolve(file.getOriginalFilename()));
            return file.getOriginalFilename();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

}