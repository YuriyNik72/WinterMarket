package ru.nikitin.marketwinter.services;

import ru.nikitin.marketwinter.entites.FileMetaDTO;
import ru.nikitin.marketwinter.repositories.interfaces.IFileMetaProvider;
import ru.nikitin.marketwinter.repositories.interfaces.IFileSystemProvider;
import ru.nikitin.marketwinter.services.interfaces.IFileStoreService;
import ru.nikitin.marketwinter.utils.HashHelper;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Collection;
import java.util.UUID;

@Component
public class FileStoreService implements IFileStoreService {

    @Autowired
    IFileSystemProvider systemProvider;

    @Autowired
    IFileMetaProvider fileMetaProvider;

    @Override
    public String storeFile(byte[] content, String fileName, int subFileType) throws IOException, NoSuchAlgorithmException {
        final UUID md5 = HashHelper.getMd5Hash(content);

        String filename = fileMetaProvider.checkFileExists(md5);
        if (filename == null) {
            fileMetaProvider.saveFileMeta(md5, fileName, subFileType);
            filename = systemProvider.storeFile(content, md5, fileName);
        }

        return filename;
    }

    @Override
    public byte[] getFile(UUID md5) throws IOException {
        String filename = fileMetaProvider.checkFileExists(md5);
        String ext = FilenameUtils.getExtension(filename);
        String fullFileName = md5.toString() + "." + ext;
        return  systemProvider.getFile(fullFileName);
    }

    @Override
    public Collection<FileMetaDTO> getMetaFiles(int subtype) {
       return fileMetaProvider.getMetaFiles(subtype);
    }


}
