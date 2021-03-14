/* ====================================================================
 * Copyright (c) Summer-Time-2020。 All rights reserved.
 *Licensed under the Apache License, Version 2.0 (the "License");
 *you may not use this file except in compliance with the License.
 *You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

 *Unless required by applicable law or agreed to in writing, software
 *distributed under the License is distributed on an "AS IS" BASIS,
 *WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *See the License for the specific language governing permissions and
 *limitations under the License.
 * ====================================================================
*/
#include <iostream>
#include <fstream>
#include <QDebug>
#include "gmbox.h"
#include "cgmbox_sm3.h"

Q_INVOKABLE void GMBox::sm3Files(DataModel *listmodel)
{
    qDebug()<<"sm3Files";
    for(int i = 0; i < listmodel->count(); i++)
    {
        qDebug() << listmodel->data(i);
        std::string data;
        data = readFile(listmodel->data(i).toStdString());
        unsigned char digest[CGMBOX_SM3_DIGEST_LENGTH];

        cgmbox_sm3((const unsigned char *)data.c_str(), data.size(), digest);
        for(auto i : digest)
        {
            std::cout << std::hex << digest[i];
        }
        std::cout << std::endl;
    }
}
std::string GMBox::readFile(const std::string &path)
{
    std::cout << "path=" << path << std::endl;
    std::ifstream infile(path);
    std::string str((std::istreambuf_iterator<char>(infile)),
                     std::istreambuf_iterator<char>());
    return str;
}
