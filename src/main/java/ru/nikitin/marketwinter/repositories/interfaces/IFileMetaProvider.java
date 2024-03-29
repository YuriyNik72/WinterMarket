package ru.nikitin.marketwinter.repositories.interfaces;

import ru.nikitin.marketwinter.entites.FileMetaDTO;

import java.util.Collection;
import java.util.UUID;

public interface IFileMetaProvider {

    String checkFileExists(UUID fileHash);

    /**
     * Сохранить метаданные файла
     *
     */
    void saveFileMeta(UUID Hash, String fileName, int sybType);

    Collection<FileMetaDTO> getMetaFiles(int subtype);
}
